import request from '@/utils/request'

// 查询环境特色列表
export function listEnvironmentFeatures(query) {
  return request({
    url: '/website/environment-features/list',
    method: 'get',
    params: query
  })
}

// 查询环境特色详细
export function getEnvironmentFeatures(featureId) {
  return request({
    url: '/website/environment-features/' + featureId,
    method: 'get'
  })
}

// 新增环境特色
export function addEnvironmentFeatures(data) {
  return request({
    url: '/website/environment-features',
    method: 'post',
    data: data
  })
}

// 修改环境特色
export function updateEnvironmentFeatures(data) {
  return request({
    url: '/website/environment-features',
    method: 'put',
    data: data
  })
}

// 删除环境特色
export function delEnvironmentFeatures(featureId) {
  return request({
    url: '/website/environment-features/' + featureId,
    method: 'delete'
  })
}

// 获取环境特色列表（公开接口）
export function listEnvironmentFeaturesPublic() {
  return request({
    url: '/website/environment-features/public/list',
    method: 'get',
    headers: { isToken: false }
  })
}








