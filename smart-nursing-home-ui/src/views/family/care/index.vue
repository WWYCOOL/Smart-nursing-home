<template>
  <div class="family-care">
    <div class="page-header">
      <h1>护理项目</h1>
      <el-button type="primary" @click="goToDashboard">返回首页</el-button>
    </div>

    <div v-if="loading" class="loading-container">
      <div class="loading-content">
        <i class="el-icon-loading"></i>
        <p>加载中...</p>
      </div>
    </div>

    <div v-if="elderlyInfo && !loading">
      <div class="card-block">
        <div class="card-header">
          <h3>购买生活照料服务</h3>
        </div>
        <div class="card-content">
          <el-form ref="buyForm" :model="buyForm" :rules="buyRules" label-width="120px">
            <el-form-item label="生活照料项目" prop="projectId">
              <el-select v-model="buyForm.projectId" placeholder="请选择项目" filterable @change="handleProjectChange" style="width: 100%">
                <el-option v-for="p in livingCareProjects" :key="p.projectId" :label="p.projectName" :value="p.projectId">
                  <span style="float:left">{{ p.projectName }}</span>
                  <span style="float:right;color:#8492a6;font-size:13px">￥{{ p.price }}</span>
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="项目单价">
              <el-input v-model="buyForm.projectPrice" placeholder="自动填充" disabled />
            </el-form-item>
            <el-form-item label="执行日期" prop="executeDate">
              <el-date-picker v-model="buyForm.executeDate" type="date" placeholder="选择日期" value-format="yyyy-MM-dd" style="width: 100%" />
            </el-form-item>
            <el-form-item label="执行时间" prop="executeTime">
              <el-time-picker v-model="buyForm.executeTime" placeholder="选择时间" value-format="HH:mm" style="width: 100%" />
            </el-form-item>
            <el-form-item label="次数" prop="times">
              <el-input-number v-model="buyForm.times" :min="1" :max="30" controls-position="right" />
            </el-form-item>
            <el-form-item label="执行护士" prop="nurseId">
              <el-select v-model="buyForm.nurseId" placeholder="请选择护士" filterable @change="handleNurseChange" style="width: 100%">
                <el-option v-for="n in nurseOptions" :key="n.userId" :label="n.nickName" :value="n.userId" />
              </el-select>
            </el-form-item>
            <el-form-item label="备注">
              <el-input v-model="buyForm.remark" type="textarea" :rows="3" placeholder="可填写特殊需求或说明" />
            </el-form-item>
            <div class="form-actions">
              <el-button type="primary" :loading="buySubmitting" @click="submitBuy">提 交</el-button>
            </div>
          </el-form>
        </div>
      </div>

      <div class="card-block">
        <div class="card-header">
          <h3>护理任务状态</h3>
          <el-button type="text" size="small" @click="loadTasks">刷新</el-button>
        </div>
        <div class="card-content">
          <el-table :data="taskList" size="small" style="width: 100%">
            <el-table-column label="项目" prop="projectName" align="center" />
            <el-table-column label="计划执行时间" prop="planTime" align="center" width="180">
              <template slot-scope="scope">
                <span>{{ formatDateTime(scope.row.planTime) }}</span>
              </template>
            </el-table-column>
            <el-table-column label="实际执行时间" prop="executeTime" align="center" width="180">
              <template slot-scope="scope">
                <span>{{ formatDateTime(scope.row.executeTime) }}</span>
              </template>
            </el-table-column>
            <el-table-column label="执行护士" prop="nurseName" align="center" width="140" />
            <el-table-column label="执行备注" prop="taskRemark" align="center" />
            <el-table-column label="执行照片" prop="imageUrl" align="center" width="120">
              <template slot-scope="scope">
                <image-preview v-if="scope.row.imageUrl" :src="scope.row.imageUrl" :width="50" :height="50" />
                <span v-else style="color:#999;">无</span>
              </template>
            </el-table-column>
            <el-table-column label="状态" prop="status" align="center" width="120">
              <template slot-scope="scope">
                <span>{{ getTaskStatusText(scope.row.status) }}</span>
              </template>
            </el-table-column>
          </el-table>
          <div v-if="taskList.length === 0" class="no-data">
            <i class="el-icon-document"></i>
            <p>暂无护理任务</p>
          </div>
        </div>
      </div>
    </div>

    <div class="no-data" v-if="!loading && !elderlyInfo">
      <i class="el-icon-user"></i>
      <p>暂无关联的老人信息</p>
    </div>
  </div>
</template>

<script>
import { getElderlyListByFamilyId } from "@/api/website/family-user";
import { listNursingProject } from "@/api/website/nursingProject";
import { addNursingTask, listNursingTask } from "@/api/website/nursingTask";
import { listRole, allocatedUserList } from "@/api/system/role";

export default {
  name: "FamilyCare",
  data() {
    return {
      loading: false,
      userInfo: {},
      elderlyInfo: null,
      livingCareProjects: [],
      nurseOptions: [],
      taskList: [],
      buySubmitting: false,
      buyForm: {
        projectId: undefined,
        projectName: undefined,
        projectPrice: undefined,
        executeDate: undefined,
        executeTime: undefined,
        times: 1,
        nurseId: undefined,
        nurseName: undefined,
        remark: undefined,
      },
      buyRules: {
        projectId: [{ required: true, message: "请选择项目", trigger: "change" }],
        executeDate: [{ required: true, message: "请选择日期", trigger: "change" }],
        executeTime: [{ required: true, message: "请选择时间", trigger: "change" }],
        times: [{ required: true, message: "请填写次数", trigger: "blur" }],
        nurseId: [{ required: true, message: "请选择护士", trigger: "change" }],
      },
    };
  },
  created() {
    this.initUserInfo();
    this.loadElderlyInfo();
  },
  methods: {
    initUserInfo() {
      const familyUser = JSON.parse(localStorage.getItem("family_user") || sessionStorage.getItem("family_user") || "{}");
      if (familyUser.familyId) {
        this.userInfo = familyUser;
      }
    },
    loadElderlyInfo() {
      if (!this.userInfo.familyId) {
        this.$message.error("用户信息不完整，请重新登录");
        this.$router.push("/website/family-login");
        return;
      }
      this.loading = true;
      getElderlyListByFamilyId(this.userInfo.familyId)
        .then((response) => {
          if (response.code === 200 && response.data) {
            this.elderlyInfo = response.data;
            this.loadLivingCareProjects();
            this.loadNurses();
            this.loadTasks();
          } else {
            this.$message.warning("暂未绑定老人信息，请联系管理员");
          }
          this.loading = false;
        })
        .catch((error) => {
          this.$message.error("加载老人信息失败：" + (error.message || "未知错误"));
          this.loading = false;
        });
    },
    loadLivingCareProjects() {
      listNursingProject({ projectType: "生活照料", pageNum: 1, pageSize: 100 }).then((res) => {
        const rows = res.rows || [];
        if (rows.length) {
          this.livingCareProjects = rows;
        } else {
          listNursingProject({ pageNum: 1, pageSize: 100 }).then((res2) => {
            const all = res2.rows || [];
            this.livingCareProjects = all.filter(
              (p) => p.projectType === "生活照料" || p.projectType === "1" || p.projectType === "LIVING"
            );
            if (!this.livingCareProjects.length) {
              this.$message.warning("暂无生活照料项目");
            }
          });
        }
      });
    },
    loadNurses() {
      listRole({ roleKey: "nurse", pageNum: 1, pageSize: 100 }).then((response) => {
        const nurseRole = (response.rows || []).find((item) => item.roleKey === "nurse");
        if (nurseRole) {
          allocatedUserList({ roleId: nurseRole.roleId, pageNum: 1, pageSize: 100 }).then((res) => {
            this.nurseOptions = res.rows || [];
          });
        } else {
          this.nurseOptions = [];
        }
      });
    },
    loadTasks() {
      if (!this.elderlyInfo || !this.elderlyInfo.elderlyId) {
        this.taskList = [];
        return;
      }
      listNursingTask({ elderlyId: this.elderlyInfo.elderlyId, pageNum: 1, pageSize: 10 }).then((res) => {
        this.taskList = res.rows || [];
      });
    },
    handleProjectChange(val) {
      const p = this.livingCareProjects.find((i) => i.projectId === val);
      if (p) {
        this.buyForm.projectName = p.projectName;
        this.buyForm.projectPrice = p.price;
      }
    },
    handleNurseChange(val) {
      const n = this.nurseOptions.find((i) => i.userId === val);
      if (n) {
        this.buyForm.nurseName = n.nickName;
      }
    },
    submitBuy() {
      this.$refs["buyForm"].validate((valid) => {
        if (!valid) return;
        if (!this.elderlyInfo || !this.elderlyInfo.elderlyId) {
          this.$message.error("未找到关联老人");
          return;
        }
        const times = Number(this.buyForm.times || 1);
        const date = this.buyForm.executeDate;
        const time = this.buyForm.executeTime;
        const dt = new Date(date);
        const [hh, mm] = String(time).split(":");
        dt.setHours(Number(hh || 0));
        dt.setMinutes(Number(mm || 0));
        const planTime = `${dt.getFullYear()}-${String(dt.getMonth() + 1).padStart(2, "0")}-${String(dt.getDate()).padStart(2, "0")} ${String(dt.getHours()).padStart(2, "0")}:${String(dt.getMinutes()).padStart(2, "0")}:00`;
        const payload = {
          elderlyId: this.elderlyInfo.elderlyId,
          elderlyName: this.elderlyInfo.elderlyName,
          projectId: this.buyForm.projectId,
          projectName: this.buyForm.projectName,
          projectPrice: this.buyForm.projectPrice,
          nurseId: this.buyForm.nurseId,
          nurseName: this.buyForm.nurseName,
          planTime: planTime,
          status: "0",
          taskRemark: this.buyForm.remark,
        };
        this.buySubmitting = true;
        const tasks = Array(times).fill(0).map(() => addNursingTask(payload));
        Promise.all(tasks)
          .then(() => {
            this.$modal.msgSuccess("购买成功，任务已创建");
            this.loadTasks();
            this.resetBuyForm();
          })
          .finally(() => {
            this.buySubmitting = false;
          });
      });
    },
    resetBuyForm() {
      this.buyForm = {
        projectId: undefined,
        projectName: undefined,
        projectPrice: undefined,
        executeDate: undefined,
        executeTime: undefined,
        times: 1,
        nurseId: undefined,
        nurseName: undefined,
        remark: undefined,
      };
      if (this.$refs.buyForm) this.$refs.buyForm.resetFields();
    },
    formatDate(dateTime) {
      if (!dateTime) return "";
      const d = new Date(dateTime);
      const y = d.getFullYear();
      const m = String(d.getMonth() + 1).padStart(2, "0");
      const day = String(d.getDate()).padStart(2, "0");
      return `${y}-${m}-${day}`;
    },
    formatDateTime(dateTime) {
      if (!dateTime) return "";
      const d = new Date(dateTime);
      const y = d.getFullYear();
      const m = String(d.getMonth() + 1).padStart(2, "0");
      const day = String(d.getDate()).padStart(2, "0");
      const h = String(d.getHours()).padStart(2, "0");
      const min = String(d.getMinutes()).padStart(2, "0");
      return `${y}-${m}-${day} ${h}:${min}`;
    },
    getTaskStatusText(status) {
      const map = { "0": "待执行", "1": "已完成" };
      return map[status] || status || "未知";
    },
    goToDashboard() {
      this.$router.push('/family/dashboard');
    },
  },
};
</script>

<style scoped>
.family-care {
  padding: 20px;
  background-color: #f5f5f5;
  min-height: 100vh;
}

.page-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
  padding: 20px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.page-header h1 {
  margin: 0;
  color: #333;
  font-size: 24px;
}

.loading-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 200px;
}

.loading-content {
  text-align: center;
  color: #666;
}

.loading-content i {
  font-size: 24px;
  margin-bottom: 10px;
  animation: rotating 2s linear infinite;
}

.loading-content p {
  margin: 0;
  font-size: 14px;
}

@keyframes rotating {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.card-block {
  background: white;
  border-radius: 8px;
  margin-bottom: 20px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px;
  background: #f8f9fa;
  border-bottom: 1px solid #e8e8e8;
}

.card-header h3 {
  margin: 0;
  color: #333;
  font-size: 16px;
  font-weight: 600;
}

.card-content { padding: 20px; }

.form-actions { text-align: right; }

.no-data {
  text-align: center;
  padding: 40px 0;
  color: #999;
  font-size: 14px;
}

@media (max-width: 768px) {
  .family-care { padding: 15px; }
  .card-content { padding: 15px; }
}
</style>
