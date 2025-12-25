import request from '@/utils/request'

// 查询营养膳食特色列表
export function listNutritionFeatures(query) {
  return request({
    url: '/website/nutrition-features/list',
    method: 'get',
    params: query
  })
}

// 查询营养膳食特色详细
export function getNutritionFeatures(featureId) {
  return request({
    url: '/website/nutrition-features/' + featureId,
    method: 'get'
  })
}

// 新增营养膳食特色
export function addNutritionFeatures(data) {
  return request({
    url: '/website/nutrition-features',
    method: 'post',
    data: data
  })
}

// 修改营养膳食特色
export function updateNutritionFeatures(data) {
  return request({
    url: '/website/nutrition-features',
    method: 'put',
    data: data
  })
}

// 删除营养膳食特色
export function delNutritionFeatures(featureId) {
  return request({
    url: '/website/nutrition-features/' + featureId,
    method: 'delete'
  })
}

// 获取营养膳食特色公开列表（无需登录）
export function listNutritionFeaturesPublic() {
  return request({
    url: '/website/nutrition-features/public/list',
    method: 'get',
    headers: { isToken: false }
  })
}



