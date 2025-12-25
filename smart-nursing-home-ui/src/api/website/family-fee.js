import request from '@/utils/request'

// 查询家属费用明细列表
export function listFamilyFee(query) {
  return request({
    url: '/website/fee/family/list',
    method: 'get',
    params: query,
    headers: {
      isToken: false
    }
  })
}

// 查询家属账单列表
export function listFamilyBills(query) {
  return request({
    url: '/website/fee/family/bills',
    method: 'get',
    params: query,
    headers: {
      isToken: false
    }
  })
}

// 查询家属费用统计
export function getFamilyFeeStatistics(query) {
  return request({
    url: '/website/fee/family/statistics',
    method: 'get',
    params: query,
    headers: {
      isToken: false
    }
  })
}

// 查询家属月度费用汇总
export function getFamilyMonthlyFee(query) {
  return request({
    url: '/website/fee/family/monthly',
    method: 'get',
    params: query,
    headers: {
      isToken: false
    }
  })
}

// 支付费用（单笔）
export function payFamilyFee(data) {
  return request({
    url: '/website/fee/family/pay',
    method: 'post',
    data: data,
    headers: {
      isToken: false
    }
  })
}

// 支付账单（整单）
export function payFamilyBill(data) {
  return request({
    url: '/website/fee/family/pay-bill',
    method: 'post',
    data: data,
    headers: {
      isToken: false
    }
  })
}
