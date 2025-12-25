import request from '@/utils/request'

// 查询网站通知公告列表（家属端使用）
export function listWebsiteNotice(query) {
  return request({
    url: '/website/notice/list',
    method: 'get',
    params: query,
    headers: {
      isToken: false
    }
  })
}

// 查询网站通知公告详细（家属端使用）
export function getWebsiteNotice(noticeId) {
  return request({
    url: '/website/notice/' + noticeId,
    method: 'get',
    headers: {
      isToken: false
    }
  })
}
