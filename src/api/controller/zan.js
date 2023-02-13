const Base = require('./base.js')

module.exports = class extends Base {
  indexAction() {
    return this.display()
  }

  async getZanedUserListAction() {
    const { post_id, page } = this.post()
    const res = await this.model('zan')
      .where({ post_id })
      .alias('a')
      .join({
        user: {
          join: 'left',
          as: 'b',
          on: ['user_id', 'b.id']
        }
      })
      .field('b.id,b.nickname,b.avatar')
      .page(page, 10)
      .countSelect()

    for (const v of res.data) {
      // 用户头像
      v.avatar = this.generateUri('avatars', v.avatar)
    }

    return this.success(res, '获取赞过的用列表成功')
  }

  async zanPostAction() {
    const { post_id, brand, model, user_id2 } = this.post()
    const loginer = await this.getLoginer()
    const user_id = loginer.id
    const zan_model = this.model('zan')
    const num = await zan_model.where({ post_id, user_id }).count()
    if (num) {
      await zan_model.where({ post_id, user_id }).delete()
    } else {
      await zan_model.add({ post_id, user_id, brand, model, user_id2 })
    }
    return this.success('', '点赞/取消点赞成功')
  }

  async getZanListAction() {
    const { page } = this.post()
    const user = await this.getLoginer()
    const zanModel = this.model('zan')
    const res = await zanModel
      .where({ user_id2: user.id })
      .alias('a')
      .join({
        user: {
          join: 'left',
          as: 'b',
          on: ['user_id', 'b.id']
        },
        post: {
          join: 'left',
          as: 'c',
          on: ['post_id', 'c.id']
        }
      })
      .field('id,user_id,post_id,zan_time,brand,model,b.nickname,b.auth,b.avatar,c.content')
      .page(page, 10)
      .countSelect()
    for (const v of res.data) {
      // 用户头像
      v.avatar = this.generateUri('avatars', v.avatar)
    }

    // 全部已读
    await zanModel.where({ user_id2: user.id }).update({ unread: 0 })
    await this.model('zan_comment').where({ user_id2: user.id }).update({ unread: 0 })

    return this.success(res, '获取“给你微博点赞”列表成功')
  }
}
