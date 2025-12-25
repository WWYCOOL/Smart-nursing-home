import request from '@/utils/request'

// 查询网站预约信息列表
export function listAppointment(query) {
  return request({
    url: '/website/appointment/list',
    method: 'get',
    params: query
  })
}

// 查询网站预约信息详细
export function getAppointment(appointmentId) {
  return request({
    url: '/website/appointment/' + appointmentId,
    method: 'get'
  })
}

// 新增网站预约信息
export function addAppointment(data) {
  return request({
    url: '/website/appointment/public/submit',
    method: 'post',
    data: data,
    headers: { isToken: false }
  })
}

// 修改网站预约信息
export function updateAppointment(data) {
  return request({
    url: '/website/appointment',
    method: 'put',
    data: data
  })
}

// 删除网站预约信息
export function delAppointment(appointmentId) {
  return request({
    url: '/website/appointment/' + appointmentId,
    method: 'delete'
  })
}

// 确认预约
export function confirmAppointment(data) {
  return request({
    url: '/website/appointment/confirm',
    method: 'post',
    data: data
  })
}

// 取消预约
export function cancelAppointment(data) {
  return request({
    url: '/website/appointment/cancel',
    method: 'post',
    data: data
  })
}



