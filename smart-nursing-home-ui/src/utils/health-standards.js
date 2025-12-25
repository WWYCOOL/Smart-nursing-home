/**
 * 健康标准配置
 * 可以根据医学标准和实际情况调整这些数值
 */

// 默认健康标准
const DEFAULT_HEALTH_STANDARDS = {
  // 血压标准 (收缩压/舒张压)
  BLOOD_PRESSURE: {
    NORMAL_LOW: { systolic: 90, diastolic: 60 },      // 正常范围下限
    NORMAL_HIGH: { systolic: 120, diastolic: 80 },    // 正常范围上限
    HIGH: { systolic: 140, diastolic: 90 }           // 高于此值为偏高
  },
  
  // 心率标准 (次/分)
  HEART_RATE: {
    NORMAL_LOW: 60,    // 正常范围下限
    NORMAL_HIGH: 100,  // 正常范围上限
    HIGH: 120          // 高于此值为偏快
  },
  
  // 体温标准 (°C)
  TEMPERATURE: {
    NORMAL_LOW: 36.0,     // 正常范围下限
    NORMAL_HIGH: 37.0,    // 正常范围上限
    HIGH: 37.3            // 高于此值为发热
  }
};

/**
 * 获取当前健康标准配置
 * 优先使用localStorage中的配置，否则使用默认配置
 */
export function getHealthStandards() {
  try {
    const saved = localStorage.getItem('health_standards');
    if (saved) {
      const customStandards = JSON.parse(saved);
      return {
        BLOOD_PRESSURE: {
          NORMAL_LOW: customStandards.bloodPressure.normalLow,
          NORMAL_HIGH: customStandards.bloodPressure.normalHigh,
          HIGH: customStandards.bloodPressure.high
        },
        HEART_RATE: {
          NORMAL_LOW: customStandards.heartRate.normalLow,
          NORMAL_HIGH: customStandards.heartRate.normalHigh,
          HIGH: customStandards.heartRate.high
        },
        TEMPERATURE: {
          NORMAL_LOW: customStandards.temperature.normalLow,
          NORMAL_HIGH: customStandards.temperature.normalHigh,
          HIGH: customStandards.temperature.high
        }
      };
    }
  } catch (e) {
    console.warn('加载自定义健康标准失败，使用默认配置:', e);
  }
  
  return DEFAULT_HEALTH_STANDARDS;
}

/**
 * 血压状态评估
 * @param {string|number} bloodPressure 血压值，如 "120/80" 或 "120-80"
 * @returns {object} {status: string, class: string, description: string}
 */
export function evaluateBloodPressure(bloodPressure) {
  if (!bloodPressure) {
    return { status: '正常', class: 'health-normal', description: '暂无数据' };
  }
  
  // 解析血压值
  const bp = bloodPressure.toString().replace(/[^\d\/\-]/g, '');
  const parts = bp.split(/[\/\-]/);
  
  if (parts.length !== 2) {
    return { status: '正常', class: 'health-normal', description: '数据格式异常' };
  }
  
  const systolic = parseInt(parts[0]);
  const diastolic = parseInt(parts[1]);
  
  if (isNaN(systolic) || isNaN(diastolic)) {
    return { status: '正常', class: 'health-normal', description: '数据格式异常' };
  }
  
  const standards = getHealthStandards();
  const { NORMAL_LOW, NORMAL_HIGH, HIGH } = standards.BLOOD_PRESSURE;
  
  if (systolic < NORMAL_LOW.systolic || diastolic < NORMAL_LOW.diastolic) {
    return { 
      status: '偏低', 
      class: 'health-low', 
      description: '血压偏低，建议咨询医生' 
    };
  } else if (systolic >= HIGH.systolic || diastolic >= HIGH.diastolic) {
    return { 
      status: '偏高', 
      class: 'health-high', 
      description: '血压偏高，建议及时就医' 
    };
  } else if (systolic > NORMAL_HIGH.systolic || diastolic > NORMAL_HIGH.diastolic) {
    return { 
      status: '正常偏高', 
      class: 'health-warning', 
      description: '血压正常偏高，注意监测' 
    };
  } else {
    return { 
      status: '正常', 
      class: 'health-normal', 
      description: '血压正常' 
    };
  }
}

/**
 * 心率状态评估
 * @param {string|number} heartRate 心率值
 * @returns {object} {status: string, class: string, description: string}
 */
export function evaluateHeartRate(heartRate) {
  if (!heartRate) {
    return { status: '正常', class: 'health-normal', description: '暂无数据' };
  }
  
  const hr = parseInt(heartRate.toString().replace(/[^\d]/g, ''));
  if (isNaN(hr)) {
    return { status: '正常', class: 'health-normal', description: '数据格式异常' };
  }
  
  const standards = getHealthStandards();
  const { NORMAL_LOW, NORMAL_HIGH, HIGH } = standards.HEART_RATE;
  
  if (hr < NORMAL_LOW) {
    return { 
      status: '偏慢', 
      class: 'health-low', 
      description: '心率偏慢，建议咨询医生' 
    };
  } else if (hr > HIGH) {
    return { 
      status: '偏快', 
      class: 'health-high', 
      description: '心率偏快，建议及时就医' 
    };
  } else if (hr > NORMAL_HIGH) {
    return { 
      status: '正常偏高', 
      class: 'health-warning', 
      description: '心率正常偏高，注意监测' 
    };
  } else {
    return { 
      status: '正常', 
      class: 'health-normal', 
      description: '心率正常' 
    };
  }
}

/**
 * 体温状态评估
 * @param {string|number} temperature 体温值
 * @returns {object} {status: string, class: string, description: string}
 */
export function evaluateTemperature(temperature) {
  if (!temperature) {
    return { status: '正常', class: 'health-normal', description: '暂无数据' };
  }
  
  const temp = parseFloat(temperature.toString().replace(/[^\d\.]/g, ''));
  if (isNaN(temp)) {
    return { status: '正常', class: 'health-normal', description: '数据格式异常' };
  }
  
  const standards = getHealthStandards();
  const { NORMAL_LOW, NORMAL_HIGH, HIGH } = standards.TEMPERATURE;
  
  if (temp < NORMAL_LOW) {
    return { 
      status: '偏低', 
      class: 'health-low', 
      description: '体温偏低，注意保暖' 
    };
  } else if (temp >= HIGH) {
    return { 
      status: '发热', 
      class: 'health-high', 
      description: '体温发热，建议及时就医' 
    };
  } else if (temp > NORMAL_HIGH) {
    return { 
      status: '微热', 
      class: 'health-warning', 
      description: '体温微热，注意观察' 
    };
  } else {
    return { 
      status: '正常', 
      class: 'health-normal', 
      description: '体温正常' 
    };
  }
}
