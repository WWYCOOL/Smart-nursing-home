<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="床位编号" prop="bedNumber">
        <el-input
          v-model="queryParams.bedNumber"
          placeholder="请输入床位编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="房间号" prop="roomNumber">
        <el-input
          v-model="queryParams.roomNumber"
          placeholder="请输入房间号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="床位状态" prop="bedStatus">
        <el-select v-model="queryParams.bedStatus" placeholder="请选择床位状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_bed_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['website:bed:add']"
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
          v-hasPermi="['website:bed:edit']"
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
          v-hasPermi="['website:bed:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['website:bed:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="bedList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="床位ID" align="center" prop="bedId" />
      <el-table-column label="床位编号" align="center" prop="bedNumber" />
      <el-table-column label="房间号" align="center" prop="roomNumber" />
      <el-table-column label="床位价格" align="center" prop="price" />
      <el-table-column label="床位状态" align="center" prop="bedStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_bed_status" :value="scope.row.bedStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['website:bed:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['website:bed:remove']"
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

    <!-- 添加或修改床位管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="床位编号" prop="bedNumber">
          <el-input v-model="form.bedNumber" placeholder="请输入床位编号" />
        </el-form-item>
        <el-form-item label="所属房间" prop="roomId">
          <el-select 
            v-model="form.roomId" 
            placeholder="请选择房间" 
            filterable 
            @change="handleRoomChange"
            style="width: 100%"
          >
            <el-option
              v-for="room in roomOptions"
              :key="room.roomId"
              :label="room.roomNumber + ' (' + (roomTypeMap[room.roomType] || room.roomType || '未分类') + ')'"
              :value="room.roomId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="床位价格" prop="price">
          <el-input v-model="form.price" placeholder="请输入床位价格" />
        </el-form-item>
        <el-form-item label="床位状态" prop="bedStatus">
          <el-radio-group v-model="form.bedStatus">
            <el-radio
              v-for="dict in dict.type.sys_bed_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
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
import { listBed, getBed, delBed, addBed, updateBed } from "@/api/website/bed"
import { listRoom } from "@/api/website/room"

export default {
  name: "Bed",
  dicts: ['sys_bed_status'],
  data() {
    return {
      // 房间选项
      roomOptions: [],
      // 房间类型映射
      roomTypeMap: {
        'single': '单人间',
        'double': '双人间',
        'triple': '三人间',
        'luxury': '豪华间'
      },
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
      // 床位管理表格数据
      bedList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        bedNumber: null,
        roomNumber: null,
        bedStatus: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        bedNumber: [
          { required: true, message: "床位编号不能为空", trigger: "blur" }
        ],
        roomId: [
          { required: true, message: "所属房间ID不能为空", trigger: "change" }
        ],
        price: [
          { required: true, message: "床位价格不能为空", trigger: "blur" }
        ],
        bedStatus: [
          { required: true, message: "床位状态不能为空", trigger: "change" }
        ],
      }
    }
  },
  created() {
    this.getList()
    this.getRoomList()
  },
  methods: {
    /** 查询房间列表 */
    getRoomList() {
      listRoom({ pageNum: 1, pageSize: 1000 }).then(response => {
        this.roomOptions = response.rows
      })
    },
    /** 房间选择变化 */
    handleRoomChange(roomId) {
      const room = this.roomOptions.find(item => item.roomId === roomId)
      if (room) {
        this.form.roomNumber = room.roomNumber
      }
    },
    /** 查询床位管理列表 */
    getList() {
      this.loading = true
      listBed(this.queryParams).then(response => {
        this.bedList = response.rows
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
        bedId: null,
        bedNumber: null,
        roomId: null,
        roomNumber: null,
        elderlyId: null,
        price: null,
        bedStatus: null,
        sortOrder: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      }
      this.resetForm("form")
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
      this.ids = selection.map(item => item.bedId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加床位管理"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const bedId = row.bedId || this.ids
      getBed(bedId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改床位管理"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.bedId != null) {
            updateBed(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addBed(this.form).then(response => {
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
      const bedIds = row.bedId || this.ids
      this.$modal.confirm('是否确认删除床位管理编号为"' + bedIds + '"的数据项？').then(function() {
        return delBed(bedIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('website/bed/export', {
        ...this.queryParams
      }, `bed_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
