import request from '@/utils/request'

// 查询床位管理列表
export function listBed(query) {
  return request({
    url: '/website/bed/list',
    method: 'get',
    params: query
  })
}

// 查询床位管理详细
export function getBed(bedId) {
  return request({
    url: '/website/bed/' + bedId,
    method: 'get'
  })
}

// 新增床位管理
export function addBed(data) {
  return request({
    url: '/website/bed',
    method: 'post',
    data: data
  })
}

// 修改床位管理
export function updateBed(data) {
  return request({
    url: '/website/bed',
    method: 'put',
    data: data
  })
}

// 删除床位管理
export function delBed(bedId) {
  return request({
    url: '/website/bed/' + bedId,
    method: 'delete'
  })
}
