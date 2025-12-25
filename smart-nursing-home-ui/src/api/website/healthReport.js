import request from '@/utils/request'

// 查询健康报告列表
export function listHealthReport(query) {
  return request({
    url: '/website/healthReport/list',
    method: 'get',
    params: query
  })
}

// 查询健康报告详细
export function getHealthReport(reportId) {
  return request({
    url: '/website/healthReport/' + reportId,
    method: 'get'
  })
}

// 新增健康报告
export function addHealthReport(data) {
  return request({
    url: '/website/healthReport',
    method: 'post',
    data: data
  })
}

// 修改健康报告
export function updateHealthReport(data) {
  return request({
    url: '/website/healthReport',
    method: 'put',
    data: data
  })
}

// 删除健康报告
export function delHealthReport(reportId) {
  return request({
    url: '/website/healthReport/' + reportId,
    method: 'delete'
  })
}


