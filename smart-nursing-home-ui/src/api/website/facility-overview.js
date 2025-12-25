import request from '@/utils/request'

// 查询环境概览配置列表
export function listFacilityOverview(query) {
  return request({
    url: '/website/facility-overview/list',
    method: 'get',
    params: query
  })
}

// 查询环境概览配置详细
export function getFacilityOverview(overviewId) {
  return request({
    url: '/website/facility-overview/' + overviewId,
    method: 'get'
  })
}

// 新增环境概览配置
export function addFacilityOverview(data) {
  return request({
    url: '/website/facility-overview',
    method: 'post',
    data: data
  })
}

// 修改环境概览配置
export function updateFacilityOverview(data) {
  return request({
    url: '/website/facility-overview',
    method: 'put',
    data: data
  })
}

// 删除环境概览配置
export function delFacilityOverview(overviewId) {
  return request({
    url: '/website/facility-overview/' + overviewId,
    method: 'delete'
  })
}

// 获取当前环境概览配置（公开接口）
export function getCurrentFacilityOverview() {
  return request({
    url: '/website/facility-overview/public/current',
    method: 'get',
    headers: {
      isToken: false
    }
  })
}











