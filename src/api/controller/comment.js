const Base = require('./base.js')

module.exports = class extends Base {
  indexAction() {
    return this.display()
  }

  async getCommentListAction() {
    const { page, post_id, parent_id } = this.post()
    const commentModel = this.model('comment')

    const where = {}
    if (post_id) {
      where.post_id = post_id
      where.parent_id = 0
    }
    parent_id && (where.parent_id = parent_id)

    const data = await commentModel
      .where(where)
      .alias('a')
      .join({
        user: {
          join: 'left',
          as: 'b',
          on: ['user_id', 'b.id']
        }
      })
      .join({
        user: {
          join: 'left',
          as: 'c',
          on: ['reply_id', 'c.id']
        }
      })
      .field(
        'id,content,time,ip,b.id as user_id,b.nickname,b.avatar,b.auth,c.id as reply_id,c.nickname as reply_nickname'
      )
      .order({ 'a.id': 'desc' })
      .page(page, 6)
      .countSelect()
    for (const v of data.data) {
      // 用户头像
      v.avatar = this.generateUri('avatars', v.avatar)

      // 是否赞过
      const user = await this.getLoginer()
      if (!user) {
        // 如果是未登录的状态下调用此接口，那么点赞状态全是0
        v.zaned = 0
      } else {
        // 如果是已登录的状态下调用此接口，那么点赞状态从数据库读取
        const num = await this.model('zan_comment').where({ user_id: user.id, comment_id: v.id }).count()
        v.zaned = num ? 1 : 0
      }

      v.zan_num = await this.model('zan_comment').where({ comment_id: v.id }).count()

      // 回复数量
      v.reply_num = await commentModel.where({ parent_id: v.id }).count()
    }

    return this.success(data, '获取评论列表成功')
  }

  async pubCommentAction() {
    const { content, post_id, parent_id, reply_id, ip } = this.post()
    const user = await this.getLoginer()
    const commentModel = this.model('comment')
    const id = await commentModel.add({ content, user_id: user.id, post_id, parent_id, reply_id, ip })
    const res = await commentModel
      .where({ 'a.id': id })
      .alias('a')
      .join({
        user: {
          join: 'left',
          as: 'b',
          on: ['user_id', 'b.id']
        }
      })
      .join({
        user: {
          join: 'left',
          as: 'c',
          on: ['reply_id', 'c.id']
        }
      })
      .field(
        'id,content,time,ip,b.id as user_id,b.nickname,b.avatar,b.auth,c.id as reply_id,c.nickname as reply_nickname'
      )
      .find()

    // 用户头像
    res.avatar = this.generateUri('avatars', res.avatar)
    // 是否赞过
    res.zaned = 0
    // 点赞数量
    res.zan_num = 0
    // 回复数量
    res.reply_num = 0

    return this.success(res, '发表评论成功')
  }

  async delCommentAction() {
    const { id } = this.post()
    await this.model('comment').where({ id }).delete()
    return this.success('', '已删除')
  }

  async getCommentInfoAction() {
    const { commentId } = this.post()
    const commentModel = this.model('comment')
    const res = await commentModel
      .where({ 'a.id': commentId })
      .alias('a')
      .join({
        user: {
          join: 'left',
          as: 'b',
          on: ['user_id', 'b.id']
        }
      })
      .field('id,content,ip,time,post_id,b.nickname,b.avatar,b.auth,b.id as user_id')
      .find()

    // 用户头像
    res.avatar = this.generateUri('avatars', res.avatar)
    // 是否赞过
    const user = await this.getLoginer()
    if (!user) {
      // 如果是未登录的状态下调用此接口，那么点赞状态全是0
      res.zaned = 0
    } else {
      // 如果是已登录的状态下调用此接口，那么点赞状态从数据库读取
      const num = await this.model('zan_comment').where({ user_id: user.id, comment_id: res.id }).count()
      res.zaned = num ? 1 : 0
    }

    res.zan_num = await this.model('zan_comment').where({ comment_id: res.id }).count()

    // 回复数量
    res.reply_num = await commentModel.where({ parent_id: res.id }).count()

    return this.success(res, '获取评论信息成功')
  }
}
