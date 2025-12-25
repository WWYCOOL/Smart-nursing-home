import request from '@/utils/request'

// 查询入住退住列表
export function listCheckIn(query) {
  return request({
    url: '/website/checkIn/list',
    method: 'get',
    params: query
  })
}

// 获取入住退住详细信息
export function getCheckIn(id) {
  return request({
    url: '/website/checkIn/' + id,
    method: 'get'
  })
}

// 新增入住退住记录
// data结构:
// {
//   elderlyId: Long, // 老人ID
//   type: String, // '1' 入住, '2' 退住
//   checkInTime: Date, // 入住时间 (type='1'时必填)
//   roomNumber: String, // 房间号 (type='1'时必填)
//   bedNumber: String, // 床位号 (type='1'时必填)
//   remark: String // 备注
// }
export function addCheckIn(data) {
  return request({
    url: '/website/checkIn',
    method: 'post',
    data: data
  })
}

// 修改入住退住记录
export function updateCheckIn(data) {
  return request({
    url: '/website/checkIn',
    method: 'put',
    data: data
  })
}

// 删除入住退住记录
export function delCheckIn(id) {
  return request({
    url: '/website/checkIn/' + id,
    method: 'delete'
  })
}
