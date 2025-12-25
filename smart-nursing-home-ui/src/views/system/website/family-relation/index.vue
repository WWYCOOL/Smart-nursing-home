<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="家属姓名" prop="familyName">
        <el-input
          v-model="queryParams.familyName"
          placeholder="请输入家属姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="老人姓名" prop="elderlyName">
        <el-input
          v-model="queryParams.elderlyName"
          placeholder="请输入老人姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="关系类型" prop="relationship">
        <el-select v-model="queryParams.relationship" placeholder="请选择关系类型" clearable>
          <el-option
            v-for="dict in dict.type.family_relationship"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="绑定状态" prop="bindStatus">
        <el-select v-model="queryParams.bindStatus" placeholder="请选择绑定状态" clearable>
          <el-option
            v-for="dict in dict.type.bind_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
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
          type="success"
          plain
          icon="el-icon-check"
          size="mini"
          :disabled="single"
          @click="handleAudit"
          v-hasPermi="['website:relation:audit']"
        >审核</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['website:relation:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="relationList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="家属姓名" align="center" prop="familyName" />
      <el-table-column label="家属手机" align="center" prop="familyPhone" />
      <el-table-column label="老人姓名" align="center" prop="elderlyName" />
      <el-table-column label="老人房间" align="center" prop="elderlyRoomNumber" />
      <el-table-column label="关系类型" align="center" prop="relationship">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.family_relationship" :value="scope.row.relationship"/>
        </template>
      </el-table-column>
      <el-table-column label="主要联系人" align="center" prop="isPrimary">
        <template slot-scope="scope">
          <el-tag :type="scope.row.isPrimary === '1' ? 'success' : 'info'">
            {{ scope.row.isPrimary === '1' ? '是' : '否' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="绑定状态" align="center" prop="bindStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.bind_status" :value="scope.row.bindStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="绑定时间" align="center" prop="bindTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.bindTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-check"
            @click="handleAudit(scope.row)"
            v-hasPermi="['website:relation:audit']"
            v-if="scope.row.bindStatus === '0'"
          >审核</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['website:relation:remove']"
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

    <!-- 审核对话框 -->
    <el-dialog title="审核绑定关系" :visible.sync="auditOpen" width="500px" append-to-body>
      <el-form ref="auditForm" :model="auditForm" :rules="auditRules" label-width="80px">
        <el-form-item label="家属姓名">
          <el-input v-model="auditForm.familyName" :disabled="true" />
        </el-form-item>
        <el-form-item label="老人姓名">
          <el-input v-model="auditForm.elderlyName" :disabled="true" />
        </el-form-item>
        <el-form-item label="关系类型">
          <el-input v-model="auditForm.relationship" :disabled="true" />
        </el-form-item>
        <el-form-item label="审核结果" prop="bindStatus">
          <el-radio-group v-model="auditForm.bindStatus">
            <el-radio label="1">通过</el-radio>
            <el-radio label="2">拒绝</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="auditForm.remark" type="textarea" placeholder="请输入审核备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitAudit">确 定</el-button>
        <el-button @click="cancelAudit">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listFamilyElderlyRelation, delFamilyElderlyRelation, auditFamilyElderlyRelation } from "@/api/website/family-relation";

export default {
  name: "FamilyRelation",
  dicts: ['family_relationship', 'bind_status'],
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
      // 关系表格数据
      relationList: [],
      // 审核弹出层标题
      auditOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        familyName: null,
        elderlyName: null,
        relationship: null,
        bindStatus: null
      },
      // 审核表单参数
      auditForm: {},
      // 审核表单校验
      auditRules: {
        bindStatus: [
          { required: true, message: "请选择审核结果", trigger: "change" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询关系列表 */
    getList() {
      this.loading = true;
      listFamilyElderlyRelation(this.queryParams).then(response => {
        this.relationList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消审核
    cancelAudit() {
      this.auditOpen = false;
      this.auditForm = {};
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
      this.ids = selection.map(item => item.relationId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 审核按钮操作 */
    handleAudit(row) {
      this.auditForm = {
        relationId: row.relationId || this.ids[0],
        familyName: row.familyName,
        elderlyName: row.elderlyName,
        relationship: row.relationship,
        bindStatus: null,
        remark: null
      };
      this.auditOpen = true;
    },
    /** 提交审核 */
    submitAudit() {
      this.$refs["auditForm"].validate(valid => {
        if (valid) {
          auditFamilyElderlyRelation({
            relationId: this.auditForm.relationId,
            bindStatus: this.auditForm.bindStatus
          }).then(response => {
            this.$modal.msgSuccess("审核成功");
            this.auditOpen = false;
            this.getList();
          });
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const relationIds = row.relationId || this.ids;
      this.$modal.confirm('是否确认删除关系编号为"' + relationIds + '"的数据项？').then(function() {
        return delFamilyElderlyRelation(relationIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    }
  }
};
</script>
