import request from '@/utils/request'

// 查询老人信息列表（家属端）
export function getElderlyInfo(query) {
  return request({
    url: '/family/elderly/info',
    method: 'get',
    params: query
  })
}

// 查询老人信息列表（家属端）- 别名
export function getElderlyInfoForFamily(query) {
  return request({
    url: '/family/elderly/info',
    method: 'get',
    params: query
  })
}

// 获取老人详细信息（家属端）
export function getElderlyDetailForFamily(elderlyId) {
  return request({
    url: '/family/elderly/' + elderlyId,
    method: 'get'
  })
}

// 获取老人健康概况（家属端）
export function getElderlyHealthSummary(elderlyId) {
  return request({
    url: '/family/elderly/' + elderlyId + '/health/summary',
    method: 'get'
  })
}

// 获取老人护理记录（家属端）
export function getElderlyCareRecords(elderlyId, query) {
  return request({
    url: '/family/elderly/' + elderlyId + '/care/records',
    method: 'get',
    params: query
  })
}
