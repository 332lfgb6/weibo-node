const Base = require('./base.js')

module.exports = class extends Base {
  async getLastChatListAction() {
    const { page } = this.post()
    const user = await this.getLoginer()
    const res = await this.model('last_chat')
      .where({ user_id1: user.id })
      .alias('a')
      .join({
        user: {
          join: 'left',
          as: 'b',
          on: ['user_id2', 'b.id']
        }
      })
      .field('id,content,send_time,unread,b.id as user_id,b.avatar,b.nickname,b.auth')
      .page(page, 10)
      .countSelect()
    for (const v of res.data) {
      // 用户头像
      v.avatar = this.generateUri('avatars', v.avatar)
    }

    return this.success(res, '获取最后的消息列表成功')
  }
}
