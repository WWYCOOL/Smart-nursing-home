import request from '@/utils/request'

// 查询网站咨询信息列表
export function listConsultation(query) {
  return request({
    url: '/website/consultation/list',
    method: 'get',
    params: query
  })
}

// 查询网站咨询信息详细
export function getConsultation(consultationId) {
  return request({
    url: '/website/consultation/' + consultationId,
    method: 'get'
  })
}

// 新增网站咨询信息
export function addConsultation(data) {
  return request({
    url: '/website/consultation/public/submit',
    method: 'post',
    data: data,
    headers: { isToken: false }
  })
}

// 修改网站咨询信息
export function updateConsultation(data) {
  return request({
    url: '/website/consultation',
    method: 'put',
    data: data
  })
}

// 删除网站咨询信息
export function delConsultation(consultationId) {
  return request({
    url: '/website/consultation/' + consultationId,
    method: 'delete'
  })
}

// 回复咨询
export function replyConsultation(data) {
  return request({
    url: '/website/consultation/reply',
    method: 'post',
    data: data
  })
}



