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
      <el-form-item label="项目名称" prop="projectName">
        <el-input
          v-model="queryParams.projectName"
          placeholder="请输入项目名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="项目单价" prop="projectPrice">
        <el-input
          v-model="queryParams.projectPrice"
          placeholder="请输入项目单价"
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
          v-hasPermi="['website:nursingTask:add']"
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
          v-hasPermi="['website:nursingTask:edit']"
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
          v-hasPermi="['website:nursingTask:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['website:nursingTask:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="nursingTaskList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="任务ID" align="center" prop="taskId" />
      <el-table-column label="老人姓名" align="center" prop="elderlyName" />
      <el-table-column label="项目名称" align="center" prop="projectName" />
      <el-table-column label="项目单价" align="center" prop="projectPrice" />
      <el-table-column label="执行护士姓名" align="center" prop="nurseName" />
      <el-table-column label="计划执行时间" align="center" prop="planTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.planTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="实际执行时间" align="center" prop="executeTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.executeTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="任务状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.nur_task_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="执行备注" align="center" prop="taskRemark" />
      <el-table-column label="执行照片" align="center" prop="imageUrl" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.imageUrl" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            v-if="scope.row.status === '0'"
            size="mini"
            type="text"
            icon="el-icon-check"
            @click="handleExecute(scope.row)"
            v-hasPermi="['website:nursingTask:edit']"
          >执行</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['website:nursingTask:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['website:nursingTask:remove']"
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

    <!-- 执行任务对话框 -->
    <el-dialog title="执行护理任务" :visible.sync="executeOpen" width="500px" append-to-body>
      <el-form ref="executeForm" :model="executeForm" label-width="80px">
        <el-form-item label="任务名称">
          <span>{{ executeForm.projectName }}</span>
        </el-form-item>
        <el-form-item label="执行人员">
          <span>{{ executeForm.nurseName || '当前用户' }}</span>
        </el-form-item>
        <el-form-item label="执行时间" prop="executeTime">
          <el-date-picker
            v-model="executeForm.executeTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="选择执行时间"
            style="width: 100%"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="执行备注" prop="taskRemark">
          <el-input v-model="executeForm.taskRemark" type="textarea" placeholder="请输入执行情况" />
        </el-form-item>
        <el-form-item label="执行照片" prop="imageUrl">
          <image-upload v-model="executeForm.imageUrl"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitExecute">确认完成</el-button>
        <el-button @click="cancelExecute">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 添加或修改护理任务对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="选择老人" prop="elderlyId">
          <el-select
            v-model="form.elderlyId"
            filterable
            remote
            reserve-keyword
            placeholder="请输入老人姓名搜索"
            :remote-method="searchElderly"
            :loading="elderlyLoading"
            @change="handleElderlyChange">
            <el-option
              v-for="item in elderlyOptions"
              :key="item.elderlyId"
              :label="item.elderlyName"
              :value="item.elderlyId">
              <span style="float: left">{{ item.elderlyName }}</span>
              <span style="float: right; color: #8492a6; font-size: 13px">{{ item.roomNumber ? item.roomNumber + '房' : '未分配' }}</span>
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="护理项目" prop="projectId">
          <el-select 
            v-model="form.projectId" 
            placeholder="请选择护理项目"
            filterable
            @change="handleProjectChange">
            <el-option
              v-for="item in projectOptions"
              :key="item.projectId"
              :label="item.projectName"
              :value="item.projectId">
              <span style="float: left">{{ item.projectName }}</span>
              <span style="float: right; color: #8492a6; font-size: 13px">￥{{ item.price }}</span>
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="项目单价" prop="projectPrice">
          <el-input v-model="form.projectPrice" placeholder="自动填充" disabled />
        </el-form-item>
        <el-form-item label="执行护士" prop="nurseId">
          <el-select 
            v-model="form.nurseId" 
            placeholder="请选择执行护士"
            filterable
            @change="handleNurseChange">
            <el-option
              v-for="item in nurseOptions"
              :key="item.userId"
              :label="item.nickName"
              :value="item.userId">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="计划执行时间" prop="planTime">
          <el-date-picker clearable
            v-model="form.planTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择计划执行时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="执行备注" prop="taskRemark">
          <el-input v-model="form.taskRemark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="执行照片" prop="imageUrl">
          <image-upload v-model="form.imageUrl"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listNursingTask, getNursingTask, delNursingTask, addNursingTask, updateNursingTask } from "@/api/website/nursingTask"
import { listElderlyInfo } from "@/api/website/elderly-info"
import { listNursingProject } from "@/api/website/nursingProject"
import { listRole, allocatedUserList } from "@/api/system/role"

export default {
  name: "NursingTask",
  dicts: ['nur_task_status'],
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
      // 护理任务表格数据
      nursingTaskList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 执行弹窗
      executeOpen: false,
      executeForm: {},
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        elderlyName: null,
        projectName: null,
        projectPrice: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        elderlyId: [
          { required: true, message: "请选择老人", trigger: "change" }
        ],
        projectId: [
          { required: true, message: "请选择护理项目", trigger: "change" }
        ],
        nurseId: [
          { required: true, message: "请选择执行护士", trigger: "change" }
        ],
        planTime: [
          { required: true, message: "计划执行时间不能为空", trigger: "blur" }
        ],
      },
      // 老人相关
      elderlyLoading: false,
      elderlyOptions: [],
      // 项目相关
      projectOptions: [],
      // 护士相关
      nurseOptions: []
    }
  },
  created() {
    this.getList()
    this.getProjectList()
    this.getNurseList()
  },
  methods: {
    /** 查询护理任务列表 */
    getList() {
      this.loading = true
      listNursingTask(this.queryParams).then(response => {
        this.nursingTaskList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        taskId: null,
        elderlyId: null,
        elderlyName: null,
        projectId: null,
        projectName: null,
        projectPrice: null,
        nurseId: null,
        nurseName: null,
        planTime: null,
        executeTime: null,
        status: "0",
        taskRemark: null,
        imageUrl: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      }
      this.resetForm("form")
      // 重置时清空老人搜索结果，避免回显问题
      this.elderlyOptions = [] 
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.taskId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加护理任务"
      this.searchElderly('') // 预加载部分老人
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const taskId = row.taskId || this.ids
      getNursingTask(taskId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改护理任务"
        // 回显老人信息（如果老人列表中没有当前老人，手动添加进去以正确显示）
        if (this.form.elderlyId && this.form.elderlyName) {
           this.elderlyOptions = [{
             elderlyId: this.form.elderlyId,
             elderlyName: this.form.elderlyName
           }]
        }
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.taskId != null) {
            updateNursingTask(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addNursingTask(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const taskIds = row.taskId || this.ids
      this.$modal.confirm('是否确认删除护理任务编号为"' + taskIds + '"的数据项？').then(function() {
        return delNursingTask(taskIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('website/nursingTask/export', {
        ...this.queryParams
      }, `nursingTask_${new Date().getTime()}.xlsx`)
    },
    /** 搜索老人 */
    searchElderly(query) {
      this.elderlyLoading = true
      listElderlyInfo({ 
        elderlyName: query, 
        pageNum: 1, 
        pageSize: 20 
      }).then(response => {
        this.elderlyOptions = response.rows
        this.elderlyLoading = false
      })
    },
    /** 选择老人回调 */
    handleElderlyChange(val) {
      const elderly = this.elderlyOptions.find(item => item.elderlyId === val)
      if (elderly) {
        this.form.elderlyName = elderly.elderlyName
      }
    },
    /** 获取护理项目列表 */
    getProjectList() {
      listNursingProject({ pageNum: 1, pageSize: 100 }).then(response => {
        this.projectOptions = response.rows
      })
    },
    /** 选择项目回调 */
    handleProjectChange(val) {
      const project = this.projectOptions.find(item => item.projectId === val)
      if (project) {
        this.form.projectName = project.projectName
        this.form.projectPrice = project.price
      }
    },
    /** 获取护士列表 */
    getNurseList() {
      listRole({ roleKey: 'nurse', pageNum: 1, pageSize: 100 }).then(response => {
        const nurseRole = (response.rows || []).find(item => item.roleKey === 'nurse')
        if (nurseRole) {
          allocatedUserList({ roleId: nurseRole.roleId, pageNum: 1, pageSize: 100 }).then(res => {
            this.nurseOptions = res.rows || []
          })
        } else {
          this.nurseOptions = []
        }
      })
    },
    /** 选择护士回调 */
    handleNurseChange(val) {
      const nurse = this.nurseOptions.find(item => item.userId === val)
      if (nurse) {
        this.form.nurseName = nurse.nickName
      }
    },
    /** 打开执行弹窗 */
    handleExecute(row) {
      this.executeForm = {
        taskId: row.taskId,
        elderlyId: row.elderlyId, // 补充老人ID，用于后端计费
        projectName: row.projectName,
        nurseName: row.nurseName, // 默认为计划执行人
        executeTime: new Date(), // 默认当前时间
        taskRemark: '',
        imageUrl: '',
        status: '1' // 状态改为已完成
      }
      this.executeOpen = true
    },
    /** 提交执行 */
    submitExecute() {
      if (!this.executeForm.executeTime) {
        this.$modal.msgError("请选择执行时间")
        return
      }
      updateNursingTask(this.executeForm).then(response => {
        this.$modal.msgSuccess("任务执行成功，费用已自动生成")
        this.executeOpen = false
        this.getList()
      })
    },
    /** 取消执行 */
    cancelExecute() {
      this.executeOpen = false
      this.executeForm = {}
    }
  }
}
</script>
