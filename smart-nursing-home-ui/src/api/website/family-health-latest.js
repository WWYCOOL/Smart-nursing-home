import request from '@/utils/request'

// 获取家属关联老人的最近一次健康报告
export function getLatestHealthReport(familyId) {
  return request({
    url: '/website/healthReport/family/latest/' + familyId,
    method: 'get',
    headers: {
      isToken: false
    }
  })
}

