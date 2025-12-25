import request from '@/utils/request'

// 查询网站沟通消息列表
export function listCommunication(query) {
  return request({
    url: '/website/communication/list',
    method: 'get',
    params: query
  })
}

// 查询网站沟通消息详细
export function getCommunication(messageId) {
  return request({
    url: '/website/communication/' + messageId,
    method: 'get'
  })
}

// 新增网站沟通消息
export function addCommunication(data) {
  return request({
    url: '/website/communication',
    method: 'post',
    data: data
  })
}

// 修改网站沟通消息
export function updateCommunication(data) {
  return request({
    url: '/website/communication',
    method: 'put',
    data: data
  })
}

// 删除网站沟通消息
export function delCommunication(messageId) {
  return request({
    url: '/website/communication/' + messageId,
    method: 'delete'
  })
}
