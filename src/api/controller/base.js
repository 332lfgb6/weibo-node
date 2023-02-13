const magic_numbers = require('../../common/config/magic_numbers')

module.exports = class extends think.Controller {
  async __before() {
    // console.log('action', this.ctx.action)

    // 白名单接口可以直接访问
    const whiteList = [
      'getVideoData',
      'getFirst',
      'getPostList',
      'login',
      'upload',
      'finishBasicInfo',
      'getPostDetail',
      'getCommentList',
      'getZanedUserList',
      'search',
      'getCommentInfo',
      'getUserInfo',

      // websocket
      'open',
      'close',
      'addUser'
    ]
    const action = this.ctx.action
    if (whiteList.includes(action)) return

    // 如果调用getLoginer拿不到user，那么需要重新登录
    const user = await this.getLoginer()
    if (!user) {
      return this.fail(magic_numbers.NEED_LOGIN, '需要重新登录')
    } else {
      return
    }
  }

  generateUri(type, filename) {
    const { resourceHost, resourcePort } = think.config()
    return filename ? `http://${resourceHost}:${resourcePort}/upload/${type}/${filename}` : ''
  }

  parseFilename(uri) {
    return uri.split('/').pop()
  }

  async getLoginer() {
    let token = this.header('authorization')

    // debugger

    if (!token) {
      return false
    }

    token = token.split(' ')[1]

    const user = await this.model('user').where({ token }).find()

    if (think.isEmpty(user)) {
      return false
    } else {
      return user
    }
  }
}
