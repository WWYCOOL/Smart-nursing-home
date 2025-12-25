import request from '@/utils/request'

// 查询费用查询列表
export function listFeeQuery(query) {
  return request({
    url: '/website/feeQuery/list',
    method: 'get',
    params: query
  })
}

// 查询费用查询详细
export function getFeeQuery(queryId) {
  return request({
    url: '/website/feeQuery/' + queryId,
    method: 'get'
  })
}

// 新增费用查询
export function addFeeQuery(data) {
  return request({
    url: '/website/feeQuery',
    method: 'post',
    data: data
  })
}

// 修改费用查询
export function updateFeeQuery(data) {
  return request({
    url: '/website/feeQuery',
    method: 'put',
    data: data
  })
}

// 删除费用查询
export function delFeeQuery(queryId) {
  return request({
    url: '/website/feeQuery/' + queryId,
    method: 'delete'
  })
}

// 处理费用查询
export function processFeeQuery(queryId) {
  return request({
    url: '/website/feeQuery/process/' + queryId,
    method: 'put'
  })
}

// 发送费用查询
export function sendFeeQuery(queryId) {
  return request({
    url: '/website/feeQuery/send/' + queryId,
    method: 'put'
  })
}

// 生成费用明细
export function generateFeeDetails(queryId) {
  return request({
    url: '/website/feeQuery/generate/' + queryId,
    method: 'post'
  })
}

// 获取费用明细列表
export function getFeeDetailList(queryId) {
  return request({
    url: '/website/feeQuery/detail/' + queryId,
    method: 'get'
  })
}

// 新增费用明细
export function addFeeDetail(data) {
  return request({
    url: '/website/feeQuery/detail',
    method: 'post',
    data: data
  })
}
