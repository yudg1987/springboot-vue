<template>
  <div class="block">
    <el-table
      :data="books"
      border
      style="width: 100%">
      <el-table-column
        fixed
        prop="id"
        label="编号"
        width="100PX">
      </el-table-column>
      <el-table-column
        prop="name"
        label="姓名"
        width="300PX">
      </el-table-column>
      <el-table-column
        prop="author"
        label="作者"
        width="300PX">
      </el-table-column>
      <el-table-column
        fixed="right"
        label="操作"
        width="300PX">
        <template slot-scope="scope">
          <el-button @click="handleClick(scope.row)" type="text" size="small">修改</el-button>
          <el-button type="text" size="small" @click="deleteRow(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page.sync="currentPage"
        :page-sizes="[10, 20, 50, 100]"
        :page-size.sync="currentPageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
      </el-pagination>
    </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'Book',
  data () {
    return {
      books: [],
      currentPage: 1,
      currentPageSize: 10,
      total: 0
    }
  },
  mounted () {
    this.doQuery()
  },
  methods: {
    handleClick (row) {
      console.log(row)
      this.$router.replace({
        path: '/updateBook',
        query: {
          id: row.id
        }
      })
    },
    deleteRow (row) {
      console.log('删除记录:' + row.id)
      axios.delete('http://localhost:8001/book/delete/' + row.id).then(resp => {
        console.log(resp)
        this.$message.success('删除记录成功')
        // 动态刷新页面
        window.location.reload()
      }).catch(error => {
        this.$message.error('删除失败')
      })
    },
    page (currentPpage) {
      this.currentPage = currentPpage
      console.log('currentPpage:' + currentPpage)
      this.doQuery()
    },
    handleSizeChange (val) {
      console.log(`每页 ${val} 条`)
      this.currentPageSize = val
      this.doQuery()
    },
    handleCurrentChange (val) {
      console.log(`当前页: ${val}`)
      this.currentPage = val
      this.doQuery()
    },
    doQuery () {
      axios.get('http://localhost:8001/book/getBooks/' + this.currentPage + '/' + this.currentPageSize).then(resp => {
        console.log(resp)
        this.books = resp.data.list
        this.total = resp.data.total
      })
    }
  }
}
</script>

<style scoped>

</style>
