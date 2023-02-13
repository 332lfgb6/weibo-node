const Base = require('./base.js')

module.exports = class extends Base {
  indexAction() {
    return this.display()
  }

  async testAction() {
    await this.model('student').group('')
  }
}
