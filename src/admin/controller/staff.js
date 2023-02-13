const code = require('../common/code.js')
const Base = require('./base.js')

module.exports = class extends Base {
  async getStaffListAction() {
    const res = []

    const res1 = {
      department: '人事部'
    }
    res1.staff = await this.model('staff')
      .where({ department: code.department.PERSONNEL })
      .field('id,name,avatar')
      .select()
    for (const v of res1.staff) {
      v.avatar = this.generateUri('avatars_staff', v.avatar)
      v.active = false
    }
    res.push(res1)

    const res2 = {
      department: '技术部'
    }
    res2.staff = await this.model('staff')
      .where({ department: code.department.TECHNOLOGY })
      .field('id,name,avatar')
      .select()
    for (const v of res2.staff) {
      v.avatar = this.generateUri('avatars_staff', v.avatar)
      v.active = false
    }
    res.push(res2)

    const res3 = {
      department: '销售部'
    }
    res3.staff = await this.model('staff').where({ department: code.department.SALES }).field('id,name,avatar').select()
    for (const v of res3.staff) {
      v.avatar = this.generateUri('avatars_staff', v.avatar)
      v.active = false
    }
    res.push(res3)

    const res4 = {
      department: '国际部'
    }
    res4.staff = await this.model('staff')
      .where({ department: code.department.INTERNATIONAL })
      .field('id,name,avatar')
      .select()
    for (const v of res4.staff) {
      v.avatar = this.generateUri('avatars_staff', v.avatar)
      v.active = false
    }
    res.push(res4)

    return this.success(res, '获取员工列表成功')
  }
}
