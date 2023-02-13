const Base = require('./base.js')
const magic_numbers = require('../../common/config/magic_numbers')

const fs = require('fs')
const path = require('path')
const rename = think.promisify(fs.rename, fs)

const { execSync } = require('child_process')

module.exports = class extends Base {
  indexAction() {
    return this.display()
  }

  async uploadAction() {
    const { UNSUPPORTED_SUFFIX, BIG_SIZE } = magic_numbers.upload
    // debugger

    // 后缀
    const file = this.file('file')
    const available = ['png', 'gif', 'jpg', 'jpeg', 'jfif', 'webp']
    const suffix = file.name.split('.')[1]
    if (!available.includes(suffix))
      return this.fail(UNSUPPORTED_SUFFIX, '只支持png、gif、jpg、jpeg、jfif、webp这6种后缀的图片')

    // 图片大小不能超过5M。
    if (file.size > 5 * 1024 * 1024) return this.fail(BIG_SIZE, '图片大小不能超过5M。')

    // 将上传的图片存储起来
    const filename = `${think.uuid('v4')}.png`
    const { folder } = this.post()
    const filePath = `upload/${folder}/${filename}`
    let filepath = path.join(think.ROOT_PATH, 'www', filePath)
    think.mkdir(path.dirname(filepath))
    await rename(file.path, filepath)

    // 生成URI。
    const file_uri = this.generateUri(folder, filename)
    return this.success(file_uri, '上传文件成功')
  }

  async searchAction() {
    const { key } = this.post()
    const user_list = await this.model('user')
      .where({ nickname: ['like', `%${key}%`] })
      .field('id,avatar,auth,vip,nickname,brief')
      .select()
    for (const v of user_list) {
      v.avatar = this.generateUri('avatars', v.avatar)

      const follow_model = this.model('follow')
      v.fans_num = await follow_model.where({ user_id2: v.id }).count()

      // 是否关注
      const user = await this.getLoginer()
      if (!user) {
        // 如果是未登录的状态下调用此接口，那么就是没关注
        v.followed = 0
      } else {
        // 如果是已登录的状态下调用此接口，那么是否关注从数据库读取
        const num = await follow_model.where({ user_id1: user.id, user_id2: v.id }).count()
        v.followed = num ? 1 : 0
      }
    }

    return this.success({ user_list }, '获取搜索结果成功')
  }

  async getUnreadNumAction() {
    const user = await this.getLoginer()
    const num1 = await this.model('last_chat').where({ user_id1: user.id }).sum('unread')
    const num2 = await this.model('zan').where({ user_id2: user.id, unread: 1 }).count()
    const num3 = await this.model('zan_comment').where({ user_id2: user.id, unread: 1 }).count()
    const num = num1 + num2 + num3
    return this.success(num, '获取未读数量成功')
  }

  async getInteractNumAction() {
    const user = await this.getLoginer()
    const num2 = await this.model('zan').where({ user_id2: user.id, unread: 1 }).count()
    const num3 = await this.model('zan_comment').where({ user_id2: user.id, unread: 1 }).count()
    const num = num2 + num3
    return this.success(num, '获取交互数量成功')
  }

  getFirstAction() {
    const { videoName } = this.post()
    const videoPath = `${think.ROOT_PATH}/www/upload/post_videos/${videoName}.mp4`
    const imgPath = `${think.ROOT_PATH}/www/upload/post_covers/${videoName}.png`
    execSync('ffmpeg -ss 00:00:01.000 -i ' + videoPath + ' -vframes 1 ' + imgPath)
  }
}
