const Base = require('./base.js')

module.exports = class extends Base {
  constructor(...arg) {
    super(...arg)
  }
  openAction() {
    console.log('ws open')
    this.emit('kkk', 4)
    return this.success()
  }
  closeAction() {
    console.log('ws close')
    return this.success()
  }
  async addUserAction() {
    console.log('addUserAction ...')

    const user = await this.getLoginer()
    console.log('---', user)

    console.log(this.wsData) // this.req.websocketData, 'thinkjs'
    console.log(this.websocket) // this.req.websocket, websocket instance
    console.log(this.isWebsocket) // this.isMethod('WEBSOCKET'), true
    return this.success()
  }
  async pubMsgAction() {}
}
