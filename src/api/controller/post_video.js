const Base = require('./base.js')

module.exports = class extends Base {
  indexAction() {
    return this.display()
  }

  async getVideoDataAction() {
    const { id } = this.post()
    let res = await this.model('post_video').where({ id }).getField('video', true)
    res = this.generateUri('post_videos', res)

    // 观看次数+1
    const user = await this.getLoginer()
    let num = 1
    if (user) {
      const post_video_view_model = this.model('post_video_view')
      const where = { user_id: user.id, video_id: id }
      num = await post_video_view_model.where(where).count()
      if (!num) {
        await post_video_view_model.add(where)
      }
    }

    return this.success({ video: res, increaseView: !num }, '获取视频数据成功')
  }
}
