import request from '@/utils/request'

// 查询老人信息列表
export function listElderlyInfo(query) {
  return request({
    url: '/website/elderlyInfo/list',
    method: 'get',
    params: query
  })
}

// 查询老人信息详细
export function getElderlyInfo(elderlyId) {
  return request({
    url: '/website/elderlyInfo/' + elderlyId,
    method: 'get'
  })
}

// 新增老人信息
export function addElderlyInfo(data) {
  return request({
    url: '/website/elderlyInfo',
    method: 'post',
    data: data
  })
}

// 修改老人信息
export function updateElderlyInfo(data) {
  return request({
    url: '/website/elderlyInfo',
    method: 'put',
    data: data
  })
}

// 删除老人信息
export function delElderlyInfo(elderlyId) {
  return request({
    url: '/website/elderlyInfo/' + elderlyId,
    method: 'delete'
  })
}

// 家属查询老人信息列表（公开接口）
export function listElderlyInfoPublic(query) {
  return request({
    url: '/website/elderly/public/list',
    method: 'get',
    params: query,
    headers: { isToken: false }
  })
}

// 家属查询老人信息详细（公开接口）
export function getElderlyInfoPublic(elderlyId) {
  return request({
    url: '/website/elderly/public/' + elderlyId,
    method: 'get',
    headers: { isToken: false }
  })
}





