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
          placeholder="请输入老人姓名或身份证号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="性别" prop="gender">
        <el-select
          v-model="queryParams.gender"
          placeholder="请选择性别"
          clearable
        >
          <el-option label="男" value="0" />
          <el-option label="女" value="1" />
        </el-select>
      </el-form-item>
      <el-form-item label="房间号" prop="roomNumber">
        <el-input
          v-model="queryParams.roomNumber"
          placeholder="请输入房间号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="护理等级" prop="careLevel">
        <el-select
          v-model="queryParams.careLevel"
          placeholder="请选择护理等级"
          clearable
        >
          <el-option label="自理" value="自理" />
          <el-option label="半自理" value="半自理" />
          <el-option label="全护理" value="全护理" />
        </el-select>
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
          v-hasPermi="['website:elderly:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['website:elderly:edit']"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['website:elderly:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['website:elderly:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="elderlyInfoList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column
        label="老人照片"
        align="center"
        prop="photoUrl"
        width="80"
      >
        <template slot-scope="scope">
          <el-image
            v-if="scope.row.photoUrl"
            :src="getImageUrl(scope.row.photoUrl)"
            :preview-src-list="[getImageUrl(scope.row.photoUrl)]"
            style="width: 50px; height: 50px; border-radius: 50%"
            fit="cover"
            @error="handleImageError"
          />
          <span v-else>暂无照片</span>
        </template>
      </el-table-column>
      <el-table-column label="老人姓名" align="center" prop="elderlyName" />
      <el-table-column label="性别" align="center" prop="gender">
        <template slot-scope="scope">
          <span v-if="scope.row.gender == '0'">男</span>
          <span v-else-if="scope.row.gender == '1'">女</span>
        </template>
      </el-table-column>
      <el-table-column
        label="出生日期"
        align="center"
        prop="birthDate"
        width="100"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.birthDate, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="身份证号"
        align="center"
        prop="idCard"
        width="180"
        show-overflow-tooltip
      />
      <el-table-column label="房间号" align="center" prop="roomNumber">
        <template slot-scope="scope">
          <span v-if="scope.row.status == '0'">{{ scope.row.roomNumber }}</span>
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="床位号" align="center" prop="bedNumber">
        <template slot-scope="scope">
          <span v-if="scope.row.status == '0'">{{ scope.row.bedNumber }}</span>
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column
        label="入退日期"
        align="center"
        prop="admissionDate"
        width="100"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.admissionDate, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="健康状况" align="center" prop="healthStatus" />
      <el-table-column label="护理等级" align="center" prop="careLevel" />
      <el-table-column
        label="紧急联系人"
        align="center"
        prop="emergencyContact"
      />
      <el-table-column label="入住状态" align="center" prop="status">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status == '0'" type="success">在住</el-tag>
          <el-tag v-else-if="scope.row.status == '1'" type="danger">未住</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['website:elderly:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['website:elderly:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改老人信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="老人姓名" prop="elderlyName">
              <el-input
                v-model="form.elderlyName"
                placeholder="请输入老人姓名"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="性别" prop="gender">
              <el-radio-group v-model="form.gender">
                <el-radio label="0">男</el-radio>
                <el-radio label="1">女</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="出生日期" prop="birthDate">
              <el-date-picker
                clearable
                v-model="form.birthDate"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="请选择出生日期"
              >
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="身份证号" prop="idCard">
              <el-input v-model="form.idCard" placeholder="请输入身份证号" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="联系电话" prop="phone">
              <el-input v-model="form.phone" placeholder="请输入联系电话" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="健康状况" prop="healthStatus">
              <el-select
                v-model="form.healthStatus"
                placeholder="请选择健康状况"
              >
                <el-option label="良好" value="良好" />
                <el-option label="一般" value="一般" />
                <el-option label="较差" value="较差" />
                <el-option label="需要关注" value="需要关注" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="护理等级" prop="careLevel">
              <el-select v-model="form.careLevel" placeholder="请选择护理等级">
                <el-option label="自理" value="自理" />
                <el-option label="半自理" value="半自理" />
                <el-option label="全护理" value="全护理" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="紧急联系人" prop="emergencyContact">
              <el-input
                v-model="form.emergencyContact"
                placeholder="请输入紧急联系人"
              />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="紧急联系电话" prop="emergencyPhone">
              <el-input
                v-model="form.emergencyPhone"
                placeholder="请输入紧急联系电话"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="老人照片" prop="photoUrl">
          <image-upload v-model="form.photoUrl" />
        </el-form-item>
        <el-form-item label="病史记录" prop="medicalHistory">
          <el-input
            v-model="form.medicalHistory"
            type="textarea"
            placeholder="请输入病史记录"
          />
        </el-form-item>
        <el-form-item label="过敏史" prop="allergies">
          <el-input
            v-model="form.allergies"
            type="textarea"
            placeholder="请输入过敏史"
          />
        </el-form-item>
        <el-form-item label="用药情况" prop="medications">
          <el-input
            v-model="form.medications"
            type="textarea"
            placeholder="请输入用药情况"
          />
        </el-form-item>
        <el-form-item label="特殊注意事项" prop="specialNotes">
          <el-input
            v-model="form.specialNotes"
            type="textarea"
            placeholder="请输入特殊注意事项"
          />
        </el-form-item>
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
import {
  listElderlyInfo,
  getElderlyInfo,
  delElderlyInfo,
  addElderlyInfo,
  updateElderlyInfo,
} from "@/api/website/elderly-info";

export default {
  name: "ElderlyInfo",
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
      // 老人信息表格数据
      elderlyInfoList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        elderlyName: null,
        gender: null,
        roomNumber: null,
        careLevel: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        elderlyName: [
          { required: true, message: "老人姓名不能为空", trigger: "blur" },
        ],
        gender: [
          { required: true, message: "性别不能为空", trigger: "change" },
        ],
        birthDate: [
          { required: true, message: "出生日期不能为空", trigger: "blur" },
        ],
        idCard: [
          { required: true, message: "身份证号不能为空", trigger: "blur" },
          {
            pattern:
              /^[1-9]\d{5}(18|19|20)\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/,
            message: "身份证号格式不正确",
            trigger: "blur",
          },
        ],
        admissionDate: [
          { required: false, message: "入退日期不能为空", trigger: "blur" },
        ],
        healthStatus: [
          { required: true, message: "健康状况不能为空", trigger: "change" },
        ],
        careLevel: [
          { required: true, message: "护理等级不能为空", trigger: "change" },
        ],
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询老人信息列表 */
    getList() {
      this.loading = true;
      listElderlyInfo(this.queryParams).then((response) => {
        this.elderlyInfoList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 处理图片URL
    getImageUrl(imageUrl) {
      if (!imageUrl) return "";
      // 如果是完整的URL（包含http或https），直接返回
      if (imageUrl.startsWith("http://") || imageUrl.startsWith("https://")) {
        return imageUrl;
      }
      // 如果是相对路径，拼接服务器地址
      return process.env.VUE_APP_BASE_API + imageUrl;
    },
    // 处理图片加载错误
    handleImageError(event) {
      event.target.src =
        "https://images.unsplash.com/photo-1559027615-cd4628902d4a?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80";
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
        elderlyName: null,
        gender: null,
        birthDate: null,
        idCard: null,
        phone: null,
        // roomNumber: null,
        // bedNumber: null,
        // admissionDate: null,
        healthStatus: null,
        careLevel: null,
        emergencyContact: null,
        emergencyPhone: null,
        medicalHistory: null,
        allergies: null,
        medications: null,
        specialNotes: null,
        photoUrl: null,
        // status: "0",
        remark: null,
      };
      this.resetForm("form");
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
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.elderlyId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加老人信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const elderlyId = row.elderlyId || this.ids;
      getElderlyInfo(elderlyId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改老人信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.elderlyId != null) {
            updateElderlyInfo(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addElderlyInfo(this.form).then((response) => {
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
      const elderlyIds = row.elderlyId || this.ids;
      this.$modal
        .confirm('是否确认删除老人信息编号为"' + elderlyIds + '"的数据项？')
        .then(function () {
          return delElderlyInfo(elderlyIds);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "website/elderly/export",
        {
          ...this.queryParams,
        },
        `老人信息_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
