<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="老人姓名" prop="elderlyName">
        <el-input
          v-model="queryParams.elderlyName"
          placeholder="请输入老人姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="身份证号" prop="idCard">
        <el-input
          v-model="queryParams.idCard"
          placeholder="请输入老人身份证号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
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
          >办理入退</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="checkInList">
      <el-table-column label="老人姓名" align="center" prop="elderlyName" />
      <el-table-column label="身份证号" align="center" prop="idCard" />
      <el-table-column label="操作类型" align="center" prop="type">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.type == '0'" type="success">入住</el-tag>
          <el-tag v-else-if="scope.row.type == '1'" type="warning">退住</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        label="办理时间"
        align="center"
        prop="checkInTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.checkInTime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="房间号" align="center" prop="roomNumber">
        <template slot-scope="scope">
          <span v-if="scope.row.type == '0'">{{ scope.row.roomNumber }}</span>
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="床位号" align="center" prop="bedNumber">
        <template slot-scope="scope">
          <span v-if="scope.row.type == '0'">{{ scope.row.bedNumber }}</span>
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 办理入退对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="选择老人" prop="elderlyId">
          <el-select
            v-model="form.elderlyId"
            placeholder="请选择老人"
            filterable
            remote
            :remote-method="remoteMethod"
            :loading="loadingElderly"
            style="width: 100%"
          >
            <el-option
              v-for="item in elderlyOptions"
              :key="item.elderlyId"
              :label="item.elderlyName + ' (' + item.idCard + ')'"
              :value="item.elderlyId"
            >
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="办理类型" prop="type">
          <el-radio-group v-model="form.type">
            <el-radio label="0">入住</el-radio>
            <el-radio label="1">退住</el-radio>
          </el-radio-group>
        </el-form-item>

        <div v-if="form.type == '0'">
          <el-form-item label="入住日期" prop="checkInTime">
            <el-date-picker
              clearable
              v-model="form.checkInTime"
              type="date"
              value-format="yyyy-MM-dd"
              placeholder="请选择入住日期"
              style="width: 100%"
            >
            </el-date-picker>
          </el-form-item>
          <el-form-item label="房间号" prop="roomNumber">
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
          <el-form-item label="床位号" prop="bedNumber">
            <el-select 
              v-model="form.bedId" 
              placeholder="请选择床位" 
              filterable 
              @change="handleBedChange"
              style="width: 100%"
              :disabled="!form.roomId"
            >
              <el-option
                v-for="bed in bedOptions"
                :key="bed.bedId"
                :label="bed.bedNumber"
                :value="bed.bedId"
                :disabled="bed.bedStatus != '0'"
              >
                <span style="float: left">{{ bed.bedNumber }}</span>
                <span style="float: right; color: #8492a6; font-size: 13px">
                  <dict-tag :options="dict.type.sys_bed_status" :value="bed.bedStatus"/>
                </span>
              </el-option>
            </el-select>
          </el-form-item>
        </div>

        <div v-if="form.type == '1'">
          <el-form-item label="退住日期" prop="checkInTime">
            <el-date-picker
              clearable
              v-model="form.checkInTime"
              type="date"
              value-format="yyyy-MM-dd"
              placeholder="请选择退住日期"
              style="width: 100%"
            >
            </el-date-picker>
          </el-form-item>
        </div>
        <el-form-item label="备注" prop="remark">
          <el-input
            v-model="form.remark"
            type="textarea"
            placeholder="请输入备注"
          />
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
import { listCheckIn, addCheckIn } from "@/api/website/check-in";
import { listElderlyInfo } from "@/api/website/elderly-info";
import { listRoom } from "@/api/website/room";
import { listBed } from "@/api/website/bed";

export default {
  name: "CheckIn",
  dicts: ['sys_bed_status'],
  data() {
    return {
      // 房间选项
      roomOptions: [],
      // 床位选项
      bedOptions: [],
      // 房间类型映射
      roomTypeMap: {
        'single': '单人间',
        'double': '双人间',
        'triple': '三人间',
        'luxury': '豪华间'
      },
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 入退记录表格数据
      checkInList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        elderlyName: null,
        idCard: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        elderlyId: [
          { required: true, message: "请选择老人", trigger: "change" },
        ],
        type: [
          { required: true, message: "请选择办理类型", trigger: "change" },
        ],
        checkInTime: [
          { required: true, message: "入住日期不能为空", trigger: "blur" },
        ],
        roomNumber: [
          { required: true, message: "房间号不能为空", trigger: "blur" },
        ],
        bedNumber: [
          { required: true, message: "床位号不能为空", trigger: "blur" },
        ],
      },
      // 老人选项
      elderlyOptions: [],
      loadingElderly: false,
    };
  },
  created() {
    this.getList();
    this.getRoomList();
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
      // 清空已选床位
      this.form.bedNumber = null
      this.form.bedId = null
      this.bedOptions = []
      
      // 填充房间号字符串
      const room = this.roomOptions.find(item => item.roomId === roomId)
      if (room) {
        this.form.roomNumber = room.roomNumber
        // 加载该房间下的床位
        listBed({ roomId: roomId, pageNum: 1, pageSize: 100 }).then(response => {
          this.bedOptions = response.rows
        })
      }
    },
    /** 床位选择变化 */
    handleBedChange(bedId) {
      const bed = this.bedOptions.find(item => item.bedId === bedId)
      if (bed) {
        this.form.bedNumber = bed.bedNumber
      }
    },
    /** 查询入退记录列表 */
    getList() {
      this.loading = true;
      listCheckIn(this.queryParams).then((response) => {
        this.checkInList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 远程搜索老人
    remoteMethod(query) {
      if (query !== "") {
        this.loadingElderly = true;
        listElderlyInfo({ elderlyName: query, pageNum: 1, pageSize: 20 }).then(
          (response) => {
            this.elderlyOptions = response.rows;
            this.loadingElderly = false;
          }
        );
      } else {
        this.elderlyOptions = [];
      }
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        elderlyId: null,
        type: "0",
        checkInTime: null,
        roomId: null,
        roomNumber: null,
        bedId: null,
        bedNumber: null,
        remark: null,
      };
      this.resetForm("form");
      // 重置老人选项
      this.elderlyOptions = [];
      // 重置床位选项
      this.bedOptions = [];
      // 预加载前10个老人
      listElderlyInfo({ pageNum: 1, pageSize: 10 }).then((response) => {
        this.elderlyOptions = response.rows;
      });
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "办理入退";
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          addCheckIn(this.form).then((response) => {
            this.$modal.msgSuccess("操作成功");
            this.open = false;
            this.getList();
          });
        }
      });
    },
  },
};
</script>
