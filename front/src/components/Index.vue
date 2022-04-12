<template>
  <el-container style="height: 900px;border: 1px solid #eee">
    <el-aside width="200px" height="100%" style="background-color: rgb(238, 241, 246)">
      <el-menu :default-openeds="['0']" router>
        <el-submenu :index="index+''" v-for="(item,index) in $router.options.routes" v-if="item.show" :key="index">
          <template slot="title"><i class="el-icon-menu"></i> {{ item.name }}</template>
          <el-menu-item :index="item2.path" v-for="(item2,index2) in item.children" :key="index2"
                        :class="$route.path === item2.path ? 'is-active' : '' ">{{
              item2.name
            }}
          </el-menu-item>
        </el-submenu>
      </el-menu>
    </el-aside>
    <el-main>
      <el-header style="text-align: right; font-size: 12px">
        <el-dropdown>
          <i class="el-icon-setting" style="margin-right: 15px"></i>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item>查看</el-dropdown-item>
            <el-dropdown-item>新增</el-dropdown-item>
            <el-dropdown-item>删除</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
        <span>王小虎</span>
      </el-header>
      <router-view></router-view>
    </el-main>
    <!--    <el-container>
          <el-header style="text-align: right; font-size: 12px">
            <el-dropdown>
              <i class="el-icon-setting" style="margin-right: 15px"></i>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item>查看</el-dropdown-item>
                <el-dropdown-item>新增</el-dropdown-item>
                <el-dropdown-item>删除</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
            <span>王小虎</span>
          </el-header>

          <el-main>
    &lt;!&ndash;        <el-table :data="tableData">
              <el-table-column prop="date" label="编号" width="140">
              </el-table-column>
              <el-table-column prop="name" label="书名" width="120">
              </el-table-column>
              <el-table-column prop="address" label="作者">
              </el-table-column>
            </el-table>&ndash;&gt;
            <router-view></router-view>
          </el-main>

        </el-container>-->

  </el-container>
</template>

<script>
export default {
  name: 'Index',
  data () {
    const item = {
      date: '2016-05-02',
      name: '王小虎',
      address: '上海市普陀区金沙江路 1518 弄'
    }
    return {
      tableData: Array(20).fill(item)
    }
  }
}
</script>

<style scoped>
.el-header {
  background-color: #B3C0D1;
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
}
</style>
