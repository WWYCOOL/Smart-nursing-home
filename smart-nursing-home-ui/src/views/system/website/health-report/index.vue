<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="老人姓名" prop="elderlyName">
        <el-input
          v-model="queryParams.elderlyName"
          placeholder="请输入老人姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="报告类型" prop="reportType">
        <el-select v-model="queryParams.reportType" placeholder="请选择报告类型" clearable>
          <el-option label="体检" value="体检" />
          <el-option label="医疗" value="医疗" />
          <el-option label="护理" value="护理" />
        </el-select>
      </el-form-item>
      <el-form-item label="报告日期" prop="reportDate">
        <el-date-picker
          v-model="dateRange"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item label="医生姓名" prop="doctorName">
        <el-input
          v-model="queryParams.doctorName"
          placeholder="请输入医生姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['website:health:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['website:health:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['website:health:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['website:health:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="healthReportList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="老人姓名" align="center" prop="elderlyName" width="100" />
      <el-table-column label="报告日期" align="center" prop="reportDate" width="120">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.reportDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="报告类型" align="center" prop="reportType" width="80">
        <template slot-scope="scope">
          <el-tag :type="getReportTypeTag(scope.row.reportType)">{{ scope.row.reportType }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="医生姓名" align="center" prop="doctorName" width="100" />
      <el-table-column label="护士姓名" align="center" prop="nurseName" width="100" />
      <el-table-column label="血压" align="center" prop="bloodPressure" width="100" />
      <el-table-column label="心率" align="center" prop="heartRate" width="80" />
      <el-table-column label="体温" align="center" prop="temperature" width="80" />
      <el-table-column label="体重" align="center" prop="weight" width="80" />
      <el-table-column label="血糖" align="center" prop="bloodSugar" width="80" />
      <el-table-column label="状态" align="center" prop="status" width="80">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleView(scope.row)"
            v-hasPermi="['website:health:query']"
          >查看</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['website:health:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['website:health:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改健康报告对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1200px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="选择老人" prop="elderlyId" v-if="!form.reportId">
              <el-select
                v-model="form.elderlyId"
                placeholder="请选择老人"
                filterable
                remote
                :remote-method="searchElderly"
                :loading="elderlyLoading"
                @change="handleElderlyChange"
                @focus="loadElderlyList"
                clearable
                style="width: 100%"
              >
                <el-option
                  v-for="item in elderlyOptions"
                  :key="item.elderlyId"
                  :label="`${item.elderlyName} (${item.roomNumber}-${item.bedNumber}) - ${item.idCard}`"
                  :value="item.elderlyId"
                >
                  <div style="display: flex; justify-content: space-between; align-items: center;">
                    <div>
                      <div style="font-weight: bold;">{{ item.elderlyName }}</div>
                      <div style="color: #8492a6; font-size: 12px;">{{ item.roomNumber }}-{{ item.bedNumber }}</div>
                    </div>
                    <div style="color: #999; font-size: 11px; text-align: right;">
                      {{ item.idCard }}
                    </div>
                  </div>
                </el-option>
                <div v-if="elderlyOptions.length === 0 && !elderlyLoading" style="text-align: center; color: #999; padding: 10px;">
                  暂无老人数据，请先添加老人信息
                </div>
              </el-select>
            </el-form-item>
            <el-form-item label="老人姓名" prop="elderlyName" v-else>
              <el-input v-model="form.elderlyName" placeholder="老人姓名" disabled />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="报告日期" prop="reportDate">
              <el-date-picker
                v-model="form.reportDate"
                type="date"
                placeholder="选择报告日期"
                value-format="yyyy-MM-dd"
              ></el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="报告类型" prop="reportType">
              <el-select v-model="form.reportType" placeholder="请选择报告类型">
                <el-option label="体检" value="体检" />
                <el-option label="医疗" value="医疗" />
                <el-option label="护理" value="护理" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="医生姓名" prop="doctorName">
              <el-input v-model="form.doctorName" placeholder="请输入医生姓名" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="护士姓名" prop="nurseName">
              <el-input v-model="form.nurseName" placeholder="请输入护士姓名" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="下次检查日期" prop="nextCheckDate">
              <el-date-picker
                v-model="form.nextCheckDate"
                type="date"
                placeholder="选择下次检查日期"
                value-format="yyyy-MM-dd"
              ></el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        
        <!-- 生命体征 -->
        <el-divider content-position="left">生命体征</el-divider>
        <el-row :gutter="20">
          <el-col :span="6">
            <el-form-item label="血压" prop="bloodPressure">
              <el-input v-model="form.bloodPressure" placeholder="如：130/80" />
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="心率" prop="heartRate">
              <el-input v-model="form.heartRate" placeholder="如：72" />
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="体温" prop="temperature">
              <el-input v-model="form.temperature" placeholder="如：36.5" />
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="体重" prop="weight">
              <el-input v-model="form.weight" placeholder="如：70.5" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="6">
            <el-form-item label="身高" prop="height">
              <el-input v-model="form.height" placeholder="如：170.0" />
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="血糖" prop="bloodSugar">
              <el-input v-model="form.bloodSugar" placeholder="如：6.2" />
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="血氧饱和度" prop="bloodOxygen">
              <el-input v-model="form.bloodOxygen" placeholder="如：98" />
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="状态" prop="status">
              <el-radio-group v-model="form.status">
                <el-radio label="0">正常</el-radio>
                <el-radio label="1">停用</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        
        <!-- 症状和诊断 -->
        <el-divider content-position="left">症状和诊断</el-divider>
        <el-form-item label="症状描述" prop="symptoms">
          <el-input v-model="form.symptoms" type="textarea" :rows="3" placeholder="请输入症状描述" />
        </el-form-item>
        <el-form-item label="诊断结果" prop="diagnosis">
          <el-input v-model="form.diagnosis" type="textarea" :rows="3" placeholder="请输入诊断结果" />
        </el-form-item>
        <el-form-item label="治疗方案" prop="treatment">
          <el-input v-model="form.treatment" type="textarea" :rows="3" placeholder="请输入治疗方案" />
        </el-form-item>
        
        <!-- 用药和护理 -->
        <el-divider content-position="left">用药和护理</el-divider>
        <el-form-item label="用药情况" prop="medications">
          <el-input v-model="form.medications" type="textarea" :rows="3" placeholder="请输入用药情况" />
        </el-form-item>
        <el-form-item label="护理记录" prop="nursingNotes">
          <el-input v-model="form.nursingNotes" type="textarea" :rows="3" placeholder="请输入护理记录" />
        </el-form-item>
        <el-form-item label="建议" prop="recommendations">
          <el-input v-model="form.recommendations" type="textarea" :rows="3" placeholder="请输入建议" />
        </el-form-item>
        
        <!-- 其他信息 -->
        <el-divider content-position="left">其他信息</el-divider>
        <el-form-item label="生命体征详情" prop="vitalSigns">
          <el-input v-model="form.vitalSigns" type="textarea" :rows="2" placeholder="请输入生命体征详情" />
        </el-form-item>
        <el-form-item label="附件" prop="attachments">
          <el-input v-model="form.attachments" placeholder="请输入附件链接" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" :rows="2" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 查看健康报告对话框 -->
    <el-dialog title="健康报告详情" :visible.sync="viewOpen" width="1000px" append-to-body>
      <div v-if="viewData">
        <el-descriptions :column="2" border>
          <el-descriptions-item label="老人姓名">{{ viewData.elderlyName }}</el-descriptions-item>
          <el-descriptions-item label="报告日期">{{ viewData.reportDate }}</el-descriptions-item>
          <el-descriptions-item label="报告类型">
            <el-tag :type="getReportTypeTag(viewData.reportType)">{{ viewData.reportType }}</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="医生姓名">{{ viewData.doctorName }}</el-descriptions-item>
          <el-descriptions-item label="护士姓名">{{ viewData.nurseName }}</el-descriptions-item>
          <el-descriptions-item label="下次检查日期">{{ viewData.nextCheckDate }}</el-descriptions-item>
        </el-descriptions>
        
        <el-divider content-position="left">生命体征</el-divider>
        <el-descriptions :column="4" border>
          <el-descriptions-item label="血压">{{ viewData.bloodPressure || '-' }}</el-descriptions-item>
          <el-descriptions-item label="心率">{{ viewData.heartRate || '-' }}</el-descriptions-item>
          <el-descriptions-item label="体温">{{ viewData.temperature || '-' }}°C</el-descriptions-item>
          <el-descriptions-item label="体重">{{ viewData.weight || '-' }}kg</el-descriptions-item>
          <el-descriptions-item label="身高">{{ viewData.height || '-' }}cm</el-descriptions-item>
          <el-descriptions-item label="血糖">{{ viewData.bloodSugar || '-' }}mmol/L</el-descriptions-item>
          <el-descriptions-item label="血氧饱和度">{{ viewData.bloodOxygen || '-' }}%</el-descriptions-item>
        </el-descriptions>
        
        <el-divider content-position="left">症状和诊断</el-divider>
        <el-descriptions :column="1" border>
          <el-descriptions-item label="症状描述">{{ viewData.symptoms || '-' }}</el-descriptions-item>
          <el-descriptions-item label="诊断结果">{{ viewData.diagnosis || '-' }}</el-descriptions-item>
          <el-descriptions-item label="治疗方案">{{ viewData.treatment || '-' }}</el-descriptions-item>
        </el-descriptions>
        
        <el-divider content-position="left">用药和护理</el-divider>
        <el-descriptions :column="1" border>
          <el-descriptions-item label="用药情况">{{ viewData.medications || '-' }}</el-descriptions-item>
          <el-descriptions-item label="护理记录">{{ viewData.nursingNotes || '-' }}</el-descriptions-item>
          <el-descriptions-item label="建议">{{ viewData.recommendations || '-' }}</el-descriptions-item>
        </el-descriptions>
        
        <el-divider content-position="left">其他信息</el-divider>
        <el-descriptions :column="1" border>
          <el-descriptions-item label="生命体征详情">{{ viewData.vitalSigns || '-' }}</el-descriptions-item>
          <el-descriptions-item label="附件">
            <el-link v-if="viewData.attachments" :href="viewData.attachments" target="_blank">查看附件</el-link>
            <span v-else>-</span>
          </el-descriptions-item>
          <el-descriptions-item label="备注">{{ viewData.remark || '-' }}</el-descriptions-item>
        </el-descriptions>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listHealthReport, getHealthReport, delHealthReport, addHealthReport, updateHealthReport } from "@/api/website/healthReport";
import { listElderlyInfo } from "@/api/website/elderly-info";

export default {
  name: "HealthReport",
  dicts: ['sys_normal_disable'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 健康报告表格数据
      healthReportList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示查看弹出层
      viewOpen: false,
      // 查看数据
      viewData: null,
      // 日期范围
      dateRange: [],
      // 老人选项
      elderlyOptions: [],
      // 老人搜索加载状态
      elderlyLoading: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        elderlyName: null,
        reportType: null,
        doctorName: null,
        reportDate: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        elderlyId: [
          { required: true, message: "请选择老人", trigger: "change" }
        ],
        reportDate: [
          { required: true, message: "报告日期不能为空", trigger: "blur" }
        ],
        reportType: [
          { required: true, message: "报告类型不能为空", trigger: "change" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询健康报告列表 */
    getList() {
      this.loading = true;
      listHealthReport(this.addDateRange(this.queryParams, this.dateRange, 'ReportDate')).then(response => {
        this.healthReportList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        reportId: null,
        elderlyId: null,
        elderlyName: null,
        reportDate: null,
        reportType: null,
        doctorName: null,
        nurseName: null,
        vitalSigns: null,
        bloodPressure: null,
        heartRate: null,
        temperature: null,
        weight: null,
        height: null,
        bloodSugar: null,
        bloodOxygen: null,
        symptoms: null,
        diagnosis: null,
        treatment: null,
        medications: null,
        nursingNotes: null,
        recommendations: null,
        nextCheckDate: null,
        attachments: null,
        status: "0",
        remark: null
      };
      this.elderlyOptions = [];
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.reportId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加健康报告";
      // 加载老人列表
      this.loadElderlyList();
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const reportId = row.reportId || this.ids
      getHealthReport(reportId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改健康报告";
      });
    },
    /** 查看按钮操作 */
    handleView(row) {
      this.viewData = row;
      this.viewOpen = true;
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.reportId != null) {
            updateHealthReport(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addHealthReport(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const reportIds = row.reportId || this.ids;
      this.$modal.confirm('是否确认删除健康报告编号为"' + reportIds + '"的数据项？').then(function() {
        return delHealthReport(reportIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('website/healthReport/export', {
        ...this.queryParams
      }, `healthReport_${new Date().getTime()}.xlsx`)
    },
    /** 获取报告类型标签样式 */
    getReportTypeTag(type) {
      const typeMap = {
        '体检': 'success',
        '医疗': 'warning',
        '护理': 'info'
      };
      return typeMap[type] || '';
    },
    /** 搜索老人 */
    searchElderly(query) {
      this.elderlyLoading = true;
      const params = {
        status: '0',
        pageNum: 1,
        pageSize: 20
      };
      
      if (query && query.trim() !== '') {
        // 支持按姓名或身份证号搜索
        if (/^\d{17}[\dXx]$/.test(query.trim())) {
          // 如果是身份证号格式，按身份证号搜索
          params.idCard = query.trim();
        } else {
          // 否则按姓名搜索
          params.elderlyName = query.trim();
        }
      }
      
      listElderlyInfo(params).then(response => {
        this.elderlyOptions = response.rows || [];
        this.elderlyLoading = false;
      }).catch(() => {
        this.elderlyLoading = false;
      });
    },
    /** 选择老人 */
    handleElderlyChange(elderlyId) {
      const selectedElderly = this.elderlyOptions.find(item => item.elderlyId === elderlyId);
      if (selectedElderly) {
        this.form.elderlyName = selectedElderly.elderlyName;
      }
    },
    /** 加载老人列表 */
    loadElderlyList() {
      if (this.elderlyOptions.length === 0) {
        this.elderlyLoading = true;
        listElderlyInfo({
          status: '0',
          pageNum: 1,
          pageSize: 50
        }).then(response => {
          this.elderlyOptions = response.rows || [];
          this.elderlyLoading = false;
        }).catch(() => {
          this.elderlyLoading = false;
        });
      }
    }
  }
};
</script>




