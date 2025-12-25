<template>
  <div class="app-container">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>健康标准配置</span>
        <el-button style="float: right; padding: 3px 0" type="text" @click="resetToDefault">恢复默认</el-button>
      </div>
      
      <el-form :model="standards" label-width="120px" size="small">
        <!-- 血压标准 -->
        <el-card class="standard-card" shadow="never">
          <div slot="header">
            <span>血压标准 (收缩压/舒张压 mmHg)</span>
          </div>
          <el-row :gutter="20">
            <el-col :span="8">
              <el-form-item label="正常范围下限">
                <el-input v-model="standards.bloodPressure.normalLow.systolic" placeholder="收缩压">
                  <template slot="append">/</template>
                </el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label=" ">
                <el-input v-model="standards.bloodPressure.normalLow.diastolic" placeholder="舒张压"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-tag type="success">正常范围下限</el-tag>
            </el-col>
          </el-row>
          
          <el-row :gutter="20">
            <el-col :span="8">
              <el-form-item label="正常范围上限">
                <el-input v-model="standards.bloodPressure.normalHigh.systolic" placeholder="收缩压">
                  <template slot="append">/</template>
                </el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label=" ">
                <el-input v-model="standards.bloodPressure.normalHigh.diastolic" placeholder="舒张压"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-tag type="success">正常范围上限</el-tag>
            </el-col>
          </el-row>
          
          <el-row :gutter="20">
            <el-col :span="8">
              <el-form-item label="偏高阈值">
                <el-input v-model="standards.bloodPressure.high.systolic" placeholder="收缩压">
                  <template slot="append">/</template>
                </el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-form-item label=" ">
                <el-input v-model="standards.bloodPressure.high.diastolic" placeholder="舒张压"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-tag type="danger">高于此值为偏高</el-tag>
            </el-col>
          </el-row>
        </el-card>
        
        <!-- 心率标准 -->
        <el-card class="standard-card" shadow="never">
          <div slot="header">
            <span>心率标准 (次/分)</span>
          </div>
          <el-row :gutter="20">
            <el-col :span="8">
              <el-form-item label="正常范围下限">
                <el-input v-model="standards.heartRate.normalLow" placeholder="心率">
                  <template slot="append">次/分</template>
                </el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-tag type="success">正常范围下限</el-tag>
            </el-col>
          </el-row>
          
          <el-row :gutter="20">
            <el-col :span="8">
              <el-form-item label="正常范围上限">
                <el-input v-model="standards.heartRate.normalHigh" placeholder="心率">
                  <template slot="append">次/分</template>
                </el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-tag type="success">正常范围上限</el-tag>
            </el-col>
          </el-row>
          
          <el-row :gutter="20">
            <el-col :span="8">
              <el-form-item label="偏快阈值">
                <el-input v-model="standards.heartRate.high" placeholder="心率">
                  <template slot="append">次/分</template>
                </el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-tag type="danger">高于此值为偏快</el-tag>
            </el-col>
          </el-row>
        </el-card>
        
        <!-- 体温标准 -->
        <el-card class="standard-card" shadow="never">
          <div slot="header">
            <span>体温标准 (°C)</span>
          </div>
          <el-row :gutter="20">
            <el-col :span="8">
              <el-form-item label="正常范围下限">
                <el-input v-model="standards.temperature.normalLow" placeholder="体温">
                  <template slot="append">°C</template>
                </el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-tag type="success">正常范围下限</el-tag>
            </el-col>
          </el-row>
          
          <el-row :gutter="20">
            <el-col :span="8">
              <el-form-item label="正常范围上限">
                <el-input v-model="standards.temperature.normalHigh" placeholder="体温">
                  <template slot="append">°C</template>
                </el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-tag type="success">正常范围上限</el-tag>
            </el-col>
          </el-row>
          
          <el-row :gutter="20">
            <el-col :span="8">
              <el-form-item label="发热阈值">
                <el-input v-model="standards.temperature.high" placeholder="体温">
                  <template slot="append">°C</template>
                </el-input>
              </el-form-item>
            </el-col>
            <el-col :span="8">
              <el-tag type="danger">高于此值为发热</el-tag>
            </el-col>
          </el-row>
        </el-card>
        
        <el-form-item>
          <el-button type="primary" @click="saveStandards">保存配置</el-button>
          <el-button @click="loadStandards">重新加载</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "HealthStandards",
  data() {
    return {
      standards: {
        bloodPressure: {
          normalLow: { systolic: 90, diastolic: 60 },
          normalHigh: { systolic: 120, diastolic: 80 },
          high: { systolic: 140, diastolic: 90 }
        },
        heartRate: {
          normalLow: 60,
          normalHigh: 100,
          high: 120
        },
        temperature: {
          normalLow: 36.0,
          normalHigh: 37.0,
          high: 37.3
        }
      }
    }
  },
  created() {
    // 清理可能存在的旧配置数据
    this.clearOldConfig();
    this.loadStandards();
  },
  methods: {
    // 清理旧配置数据
    clearOldConfig() {
      try {
        const saved = localStorage.getItem('health_standards');
        if (saved) {
          const config = JSON.parse(saved);
          // 检查是否是旧格式的配置
          if (config.bloodPressure && !config.bloodPressure.normalLow) {
            console.log('检测到旧格式配置，正在清理...');
            localStorage.removeItem('health_standards');
          }
        }
      } catch (e) {
        console.log('清理旧配置时出错:', e);
        localStorage.removeItem('health_standards');
      }
    },
    
    // 加载健康标准配置
    loadStandards() {
      // 从localStorage加载配置，如果没有则使用默认值
      const saved = localStorage.getItem('health_standards');
      if (saved) {
        try {
          const loadedStandards = JSON.parse(saved);
          // 确保所有字段都存在，如果不存在则使用默认值
          this.standards = {
            bloodPressure: {
              normalLow: loadedStandards.bloodPressure?.normalLow || { systolic: 90, diastolic: 60 },
              normalHigh: loadedStandards.bloodPressure?.normalHigh || { systolic: 120, diastolic: 80 },
              high: loadedStandards.bloodPressure?.high || { systolic: 140, diastolic: 90 }
            },
            heartRate: {
              normalLow: loadedStandards.heartRate?.normalLow || 60,
              normalHigh: loadedStandards.heartRate?.normalHigh || 100,
              high: loadedStandards.heartRate?.high || 120
            },
            temperature: {
              normalLow: loadedStandards.temperature?.normalLow || 36.0,
              normalHigh: loadedStandards.temperature?.normalHigh || 37.0,
              high: loadedStandards.temperature?.high || 37.3
            }
          };
        } catch (e) {
          console.error('加载健康标准配置失败:', e);
          // 如果解析失败，使用默认配置
          this.standards = this.getDefaultStandards();
        }
      } else {
        // 如果没有保存的配置，使用默认配置
        this.standards = this.getDefaultStandards();
      }
    },
    
    // 获取默认配置
    getDefaultStandards() {
      return {
        bloodPressure: {
          normalLow: { systolic: 90, diastolic: 60 },
          normalHigh: { systolic: 120, diastolic: 80 },
          high: { systolic: 140, diastolic: 90 }
        },
        heartRate: {
          normalLow: 60,
          normalHigh: 100,
          high: 120
        },
        temperature: {
          normalLow: 36.0,
          normalHigh: 37.0,
          high: 37.3
        }
      };
    },
    
    // 保存健康标准配置
    saveStandards() {
      try {
        localStorage.setItem('health_standards', JSON.stringify(this.standards));
        this.$message.success('健康标准配置已保存');
        
        // 通知其他页面更新配置
        window.dispatchEvent(new CustomEvent('healthStandardsUpdated', {
          detail: this.standards
        }));
      } catch (e) {
        console.error('保存配置失败:', e);
        this.$message.error('保存配置失败: ' + e.message);
      }
    },
    
    // 恢复默认配置
    resetToDefault() {
      this.$confirm('确定要恢复默认配置吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.standards = this.getDefaultStandards();
        this.saveStandards();
      });
    }
  }
}
</script>

<style scoped>
.standard-card {
  margin-bottom: 20px;
}

.standard-card .el-card__header {
  background-color: #f5f7fa;
  border-bottom: 1px solid #e4e7ed;
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
