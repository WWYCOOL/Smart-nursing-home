<template>
  <div class="app-container">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>健康标准演示</span>
        <el-button style="float: right; padding: 3px 0" type="text" @click="generateRandomData">生成随机数据</el-button>
      </div>
      
      <div class="demo-section">
        <h3>血压评估演示</h3>
        <div class="demo-grid">
          <div v-for="(item, index) in bloodPressureDemo" :key="index" class="demo-item">
            <div class="demo-value">{{ item.value }}</div>
            <div class="demo-status" :class="item.class">{{ item.status }}</div>
            <div class="demo-description">{{ item.description }}</div>
          </div>
        </div>
      </div>
      
      <div class="demo-section">
        <h3>心率评估演示</h3>
        <div class="demo-grid">
          <div v-for="(item, index) in heartRateDemo" :key="index" class="demo-item">
            <div class="demo-value">{{ item.value }} 次/分</div>
            <div class="demo-status" :class="item.class">{{ item.status }}</div>
            <div class="demo-description">{{ item.description }}</div>
          </div>
        </div>
      </div>
      
      <div class="demo-section">
        <h3>体温评估演示</h3>
        <div class="demo-grid">
          <div v-for="(item, index) in temperatureDemo" :key="index" class="demo-item">
            <div class="demo-value">{{ item.value }}°C</div>
            <div class="demo-status" :class="item.class">{{ item.status }}</div>
            <div class="demo-description">{{ item.description }}</div>
          </div>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script>
import { evaluateBloodPressure, evaluateHeartRate, evaluateTemperature } from "@/utils/health-standards";

export default {
  name: "HealthStandardsDemo",
  data() {
    return {
      bloodPressureDemo: [],
      heartRateDemo: [],
      temperatureDemo: []
    }
  },
  created() {
    this.generateDemoData();
  },
  methods: {
    // 生成演示数据
    generateDemoData() {
      // 血压演示数据
      const bloodPressureValues = [
        "85/55", "95/65", "110/70", "125/85", "135/90", "150/95", "160/100"
      ];
      
      this.bloodPressureDemo = bloodPressureValues.map(value => {
        const result = evaluateBloodPressure(value);
        return {
          value,
          status: result.status,
          class: result.class,
          description: result.description
        };
      });
      
      // 心率演示数据
      const heartRateValues = [45, 55, 70, 85, 95, 110, 125];
      
      this.heartRateDemo = heartRateValues.map(value => {
        const result = evaluateHeartRate(value);
        return {
          value,
          status: result.status,
          class: result.class,
          description: result.description
        };
      });
      
      // 体温演示数据
      const temperatureValues = [35.5, 36.2, 36.8, 37.1, 37.5, 38.0, 38.5];
      
      this.temperatureDemo = temperatureValues.map(value => {
        const result = evaluateTemperature(value);
        return {
          value,
          status: result.status,
          class: result.class,
          description: result.description
        };
      });
    },
    
    // 生成随机数据
    generateRandomData() {
      this.generateDemoData();
      this.$message.success('演示数据已更新');
    }
  }
}
</script>

<style scoped>
.demo-section {
  margin-bottom: 30px;
}

.demo-section h3 {
  color: #333;
  margin-bottom: 15px;
  padding-bottom: 10px;
  border-bottom: 2px solid #e4e7ed;
}

.demo-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 15px;
}

.demo-item {
  padding: 15px;
  border: 2px solid #e4e7ed;
  border-radius: 8px;
  text-align: center;
  transition: all 0.3s ease;
}

.demo-value {
  font-size: 18px;
  font-weight: 600;
  color: #333;
  margin-bottom: 8px;
}

.demo-status {
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 5px;
  padding: 4px 8px;
  border-radius: 4px;
}

.demo-description {
  font-size: 12px;
  color: #666;
  line-height: 1.4;
}

/* 状态样式 */
.health-normal {
  color: #52c41a;
  background: #f6ffed;
  border-color: #b7eb8f;
}

.health-warning {
  color: #faad14;
  background: #fffbe6;
  border-color: #ffe58f;
}

.health-high {
  color: #ff4d4f;
  background: #fff2f0;
  border-color: #ffccc7;
}

.health-low {
  color: #1890ff;
  background: #f0f9ff;
  border-color: #91d5ff;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both;
}
</style>

