import request from '@/utils/request'

// 查询今日菜单列表
export function listNutritionMenu(query) {
  return request({
    url: '/website/nutrition-menu/list',
    method: 'get',
    params: query
  })
}

// 查询今日菜单详细
export function getNutritionMenu(menuId) {
  return request({
    url: '/website/nutrition-menu/' + menuId,
    method: 'get'
  })
}

// 新增今日菜单
export function addNutritionMenu(data) {
  return request({
    url: '/website/nutrition-menu',
    method: 'post',
    data: data
  })
}

// 修改今日菜单
export function updateNutritionMenu(data) {
  return request({
    url: '/website/nutrition-menu',
    method: 'put',
    data: data
  })
}

// 删除今日菜单
export function delNutritionMenu(menuId) {
  return request({
    url: '/website/nutrition-menu/' + menuId,
    method: 'delete'
  })
}

// 获取今日菜单公开列表（无需登录）
export function listNutritionMenuPublic() {
  return request({
    url: '/website/nutrition-menu/public/list',
    method: 'get',
    headers: { isToken: false }
  })
}



