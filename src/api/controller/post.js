const Base = require('./base.js')
const magic_numbers = require('../../common/config/magic_numbers')

module.exports = class extends Base {
  indexAction() {
    return this.display()
  }

  async getPostListAction() {
    const { page, category, key, my, user_id } = this.post()

    const where = {}
    if (my) {
      const user = await this.getLoginer()
      if (!user) {
        return this.fail(magic_numbers.NEED_LOGIN, '需要重新登录')
      } else {
        where.user_id = user.id
      }
    } else if (key) {
      where.content = ['like', `%${key}%`]
    } else if (user_id) {
      where.user_id = user_id
    } else {
      where.category = category
    }

    const data = await this.model('post')
      .where(where)
      .alias('a')
      .join({
        user: {
          join: 'left',
          as: 'b',
          on: ['user_id', 'b.id']
        },
        post_video: {
          join: 'left',
          as: 'c',
          on: ['video', 'c.id']
        }
      })
      .field('id,content,video,time,b.id as user_id,b.nickname,b.avatar,b.vip,b.auth,c.is_vertical,c.cover,c.duration')
      .order({ sort: 'asc' })
      .page(page, 10)
      .countSelect()
    for (const v of data.data) {
      // 用户头像
      v.avatar = this.generateUri('avatars', v.avatar)

      // 视频封面
      v.cover = this.generateUri('post_covers', v.cover)

      // 视频播放次数
      v.view = await this.model('post_video_view').where({ video_id: v.video }).count()

      const post_imgs = await this.model('post_img').where({ post_id: v.id }).field('img').select()
      v.post_imgs = post_imgs.map(vv => {
        return this.generateUri('post_imgs', vv.img)
      })

      // 是否赞过
      const user = await this.getLoginer()
      if (!user) {
        // 如果是未登录的状态下调用此接口，那么点赞状态全是0
        v.zaned = 0
      } else {
        // 如果是已登录的状态下调用此接口，那么点赞状态从数据库读取
        const num = await this.model('zan').where({ user_id: user.id, post_id: v.id }).count()
        v.zaned = num ? 1 : 0
      }

      // 点赞数量
      v.zan_num = await this.model('zan').where({ post_id: v.id }).count()

      // 评论数量
      v.comment_num = await this.model('comment').where({ post_id: v.id }).count()

      // 转发数量
      v.zhuanfa_num = await this.model('post').where({ refer_id: v.id }).count()
    }

    return this.success(data, '获取帖子列表成功')
  }

  async getPostDetailAction() {
    // debugger
    const { id } = this.post()
    const post = await this.model('post')
      .where({ 'a.id': id })
      .alias('a')
      .join({
        user: {
          join: 'left',
          as: 'b',
          on: ['user_id', 'b.id']
        }
      })
      .field('id,content,time,b.id as user_id,b.nickname,b.avatar,b.vip,b.auth')
      .find()
    post.avatar = this.generateUri('avatars', post.avatar)
    const post_imgs = await this.model('post_img').where({ post_id: post.id }).field('img').select()
    post.post_imgs = post_imgs.map(vv => {
      return this.generateUri('post_imgs', vv.img)
    })

    // 是否赞过
    const user = await this.getLoginer()
    if (!user) {
      // 如果是未登录的状态下调用此接口，那么点赞状态全是0
      post.zaned = 0
    } else {
      // 如果是已登录的状态下调用此接口，那么点赞状态从数据库读取
      const num = await this.model('zan').where({ user_id: user.id, post_id: post.id }).count()
      post.zaned = num ? 1 : 0
    }

    return this.success(post, '获取帖子信息成功')
  }

  async pubAction() {
    const { content, postImgs, refer_id } = this.post()
    const user = await this.getLoginer()
    const post_id = await this.model('post').add({ content, user_id: user.id, refer_id })
    for (const v of postImgs) {
      const img = this.parseFilename(v)
      await this.model('post_img').add({ post_id, img })
    }
    return this.success('', '发布成功')
  }

  async delPostAction() {
    const { id } = this.post()
    await this.model('post').where({ id }).delete()
    return this.success('', '已删除')
  }
}
