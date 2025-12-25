import request from '@/utils/request'

// 获取系统概览统计数据
export function getOverviewStatistics() {
  return request({
    url: '/website/statistics/overview',
    method: 'get'
  })
}
