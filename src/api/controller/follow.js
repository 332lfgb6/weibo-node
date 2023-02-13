const Base = require('./base.js')

module.exports = class extends Base {
  indexAction() {
    return this.display()
  }

  async followUserAction() {
    const user = await this.getLoginer()
    const user_id1 = user.id
    const { user_id2 } = this.post()
    const follow_model = this.model('follow')
    const num = await follow_model.where({ user_id1, user_id2 }).delete()
    !num && (await follow_model.add({ user_id1, user_id2 }))
    return this.success('', '关注/取关用户成功')
  }
}
