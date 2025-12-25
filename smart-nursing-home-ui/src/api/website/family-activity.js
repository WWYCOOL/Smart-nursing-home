import request from '@/utils/request'

// 查询家属最新动态
export function getFamilyRecentActivities(familyId) {
  return request({
    url: '/website/activity/family/recent/' + familyId,
    method: 'get',
    headers: {
      isToken: false
    }
  })
}

// 标记动态为已读
export function markActivityAsRead(activityId) {
  return request({
    url: '/website/activity/read/' + activityId,
    method: 'put',
    headers: {
      isToken: false
    }
  })
}
