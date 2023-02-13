const Base = require('./base.js')

module.exports = class extends Base {
  indexAction() {
    return this.display()
  }

  async pubMsgAction() {
    const { user_id2, content } = this.post()
    const user = await this.getLoginer()
    const chatModel = this.model('chat')
    const id = await chatModel.add({ user_id1: user.id, user_id2, content })

    // 更新last-chat
    const lastChatModel = this.model('last_chat')
    // 注意：需要向last-chat表添加、修改2条记录
    const lastChat = await lastChatModel.where({ user_id1: user_id2, user_id2: user.id }).find()
    if (think.isEmpty(lastChat)) {
      await lastChatModel.add({ user_id1: user_id2, user_id2: user.id, content, unread: 1 })
      await lastChatModel.add({ user_id1: user.id, user_id2, content })
    } else {
      await lastChatModel
        .where({ user_id1: user_id2, user_id2: user.id })
        .update({ content, unread: lastChat.unread + 1 })
      await lastChatModel.where({ user_id1: user.id, user_id2 }).update({ content, unread: 0 })
    }

    const chat = await chatModel
      .where({ 'a.id': id })
      .alias('a')
      .join({
        user: {
          join: 'left',
          as: 'b',
          on: ['user_id1', 'b.id']
        }
      })
      .field('user_id1,content,b.avatar')
      .find()

    // 用户头像
    chat.avatar = this.generateUri('avatars', chat.avatar)

    return this.success(chat, '发私信成功')
  }

  async getMsgListAction() {
    // 如果有max_id，表明正在获取最新的私信列表
    const { user_id2, current_max_id, current_min_id } = this.post()
    const user = await this.getLoginer()

    // 已读全部变成0
    await this.model('last_chat').where({ user_id1: user.id, user_id2 }).update({ unread: 0 })

    const where = { user_id1: ['in', [user_id2, user.id]], user_id2: ['in', [user_id2, user.id]] }
    current_max_id && (where.id = ['>', current_max_id])
    current_min_id && (where.id = ['<', current_min_id])

    const res = await this.model('chat')
      .where(where)
      .field('id,content,send_time,user_id1')
      .order({ id: current_max_id ? 'asc' : 'desc' })
      .page(1, 10)
      .countSelect()

    for (const v of res.data) {
      // 右边的气泡
      v.right = user.id === v.user_id1 ? 1 : 0
    }

    return this.success(res, '获取私信列表成功')
  }
}
