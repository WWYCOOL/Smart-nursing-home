import request from '@/utils/request'

// 查询费用明细列表
export function listFeeDetail(query) {
  return request({
    url: '/website/feeDetail/list',
    method: 'get',
    params: query
  })
}

// 查询费用明细详细
export function getFeeDetail(detailId) {
  return request({
    url: '/website/feeDetail/' + detailId,
    method: 'get'
  })
}

// 新增费用明细
export function addFeeDetail(data) {
  return request({
    url: '/website/feeDetail',
    method: 'post',
    data: data
  })
}

// 修改费用明细
export function updateFeeDetail(data) {
  return request({
    url: '/website/feeDetail',
    method: 'put',
    data: data
  })
}

// 删除费用明细
export function delFeeDetail(detailId) {
  return request({
    url: '/website/feeDetail/' + detailId,
    method: 'delete'
  })
}

// 批量更新支付状态
export function batchUpdatePayment(data) {
  return request({
    url: '/website/feeDetail/batchUpdatePayment',
    method: 'put',
    data: data
  })
}
