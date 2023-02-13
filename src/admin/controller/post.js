const Base = require('./base.js')

module.exports = class extends Base {
  indexAction() {
    return this.display()
  }

  async getPostListAction() {
    const { pageNum, pageSize, content, nickname, time } = this.post()
    // debugger

    const where = {}
    content && (where.content = ['like', `%${content}%`])
    nickname && (where.nickname = ['like', `%${nickname}%`])
    time && (where.time = ['like', `${time}%`])

    const res = await this.model('post')
      .where(where)
      .alias('a')
      .join({
        user: {
          join: 'left',
          as: 'b',
          on: ['user_id', 'b.id']
        }
      })
      .field('id,content,time,b.nickname,b.avatar')
      .page(pageNum, pageSize)
      .countSelect()

    for (const v of res.data) {
      // 用户头像
      v.avatar = this.generateUri('avatars', v.avatar)

      const post_imgs = await this.model('post_img').where({ post_id: v.id }).field('img').select()
      v.post_imgs = post_imgs.map(vv => {
        return this.generateUri('post_imgs', vv.img)
      })
    }
    return this.success(res, '获取帖子列表成功')
  }
}
