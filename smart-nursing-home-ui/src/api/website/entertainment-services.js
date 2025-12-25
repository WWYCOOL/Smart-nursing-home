import request from '@/utils/request'

// 查询文娱活动服务列表
export function listEntertainmentServices(query) {
  return request({
    url: '/website/entertainment-services/list',
    method: 'get',
    params: query
  })
}

// 查询文娱活动服务详细
export function getEntertainmentServices(activityId) {
  return request({
    url: '/website/entertainment-services/' + activityId,
    method: 'get'
  })
}

// 新增文娱活动服务
export function addEntertainmentServices(data) {
  return request({
    url: '/website/entertainment-services',
    method: 'post',
    data: data
  })
}

// 修改文娱活动服务
export function updateEntertainmentServices(data) {
  return request({
    url: '/website/entertainment-services',
    method: 'put',
    data: data
  })
}

// 删除文娱活动服务
export function delEntertainmentServices(activityId) {
  return request({
    url: '/website/entertainment-services/' + activityId,
    method: 'delete'
  })
}

// 获取文娱活动服务公开列表（无需登录）
export function listEntertainmentServicesPublic() {
  return request({
    url: '/website/entertainment-services/public/list',
    method: 'get',
    headers: { isToken: false }
  })
}






