const Base = require('./base.js')

module.exports = class extends Base {
  indexAction() {
    return this.display()
  }

  async zanCommentAction() {
    const { comment_id, user_id2, brand, model } = this.post()
    const loginer = await this.getLoginer()
    const user_id = loginer.id
    const zan_comment_model = this.model('zan_comment')
    const num = await zan_comment_model.where({ comment_id, user_id }).count()
    if (num) {
      await zan_comment_model.where({ comment_id, user_id }).delete()
    } else {
      await zan_comment_model.add({ comment_id, user_id, user_id2, brand, model })
    }
    return this.success('', '点赞/取消点赞成功')
  }

  async getZanCommentListAction() {
    const { page } = this.post()
    const user = await this.getLoginer()
    const res = await this.model('zan_comment')
      .where({ user_id2: user.id })
      .alias('a')
      .join({
        user: {
          join: 'left',
          as: 'b',
          on: ['user_id', 'b.id']
        },
        comment: {
          join: 'left',
          as: 'c',
          on: ['comment_id', 'c.id']
        }
      })
      .field('id,user_id,zan_time,brand,model,b.nickname,b.auth,b.avatar,c.content,c.post_id')
      .page(page, 10)
      .countSelect()
    for (const v of res.data) {
      // 用户头像
      v.avatar = this.generateUri('avatars', v.avatar)
      v.isComment = true
    }

    return this.success(res, '获取“给你评论点赞”列表成功')
  }
}
