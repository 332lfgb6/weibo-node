const Base = require('./base.js')
const magic_numbers = require('../../common/config/magic_numbers')

module.exports = class extends Base {
  indexAction() {
    return this.display()
  }

  async loginAction() {
    const { phone } = this.post()
    const token = think.uuid('v4')
    const num = await this.model('user').where({ phone }).update({ token })
    const res = num ? token : ''
    return this.success(res, '登录成功')
  }

  async finishBasicInfoAction() {
    const form = this.post()

    form.avatar = this.parseFilename(form.avatar)
    form.wallpaper = this.parseFilename(form.wallpaper) || 'default.jpg'

    const userModel = this.model('user')
    if (form.phone) {
      const token = think.uuid('v4')
      await userModel.add({ ...form, token })
      return this.success(token, '登录成功')
    } else {
      const user = await this.getLoginer()
      let id
      if (!user) {
        return this.fail(magic_numbers.NEED_LOGIN, '需要重新登录')
      } else {
        id = user.id
      }
      await userModel.where({ id }).update({ ...form })
      return this.success('', '编辑成功')
    }
  }

  async getUserInfoAction() {
    let { id } = this.post()
    // debugger
    const user = await this.getLoginer()
    if (!id) {
      if (!user) {
        return this.fail(magic_numbers.NEED_LOGIN, '需要重新登录')
      } else {
        id = user.id
      }
    }
    const res = await this.model('user')
      .where({ id })
      .field('id,nickname,avatar,auth,vip,wallpaper,gender,brief')
      .find()

    // 用户头像
    res.avatar = this.generateUri('avatars', res.avatar)
    // 壁纸
    res.wallpaper = this.generateUri('wallpapers', res.wallpaper)
    // 关注数量
    const followModel = this.model('follow')
    res.follow_num = await followModel.where({ user_id1: res.id }).count()
    // 粉丝数量
    res.fans_num = await followModel.where({ user_id2: res.id }).count()
    // 微博数量
    res.post_num = await this.model('post').where({ user_id: id }).count()
    // profile页面获取用户信息的时候，需要检查你是否关注了ta
    if (id) {
      if (!user) {
        res.is_follow = 0
      } else {
        res.is_follow = await followModel.where({ user_id1: user.id, user_id2: id }).count()
      }
    }

    return this.success(res, '获取用户信息成功')
  }
}
