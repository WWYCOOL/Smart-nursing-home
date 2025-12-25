import request from '@/utils/request'

// 查询家属关联老人的健康报告列表
export function listFamilyHealthReport(query) {
  return request({
    url: '/website/healthReport/family/list',
    method: 'get',
    params: query,
    headers: {
      isToken: false
    }
  })
}

// 查询健康报告详细
export function getFamilyHealthReport(reportId) {
  return request({
    url: '/website/healthReport/family/' + reportId,
    method: 'get',
    headers: {
      isToken: false
    }
  })
}
