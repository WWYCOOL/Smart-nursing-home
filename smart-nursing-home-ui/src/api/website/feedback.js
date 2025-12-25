import request from '@/utils/request'

// 查询意见反馈列表
export function listFeedback(query) {
  return request({
    url: '/website/feedback/list',
    method: 'get',
    params: query
  })
}

// 查询意见反馈详细
export function getFeedback(feedbackId) {
  return request({
    url: '/website/feedback/' + feedbackId,
    method: 'get'
  })
}

// 新增意见反馈
export function addFeedback(data) {
  return request({
    url: '/website/feedback',
    method: 'post',
    data: data
  })
}

// 修改意见反馈
export function updateFeedback(data) {
  return request({
    url: '/website/feedback',
    method: 'put',
    data: data
  })
}

// 删除意见反馈
export function delFeedback(feedbackId) {
  return request({
    url: '/website/feedback/' + feedbackId,
    method: 'delete'
  })
}

// 回复意见反馈
export function replyFeedback(data) {
  return request({
    url: '/website/feedback/reply',
    method: 'put',
    data: data
  })
}

// 处理意见反馈
export function processFeedback(data) {
  return request({
    url: '/website/feedback/process',
    method: 'put',
    data: data
  })
}
