<template>
  <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
    <el-form-item label="书籍名称" prop="name">
      <el-input v-model="ruleForm.name"></el-input>
    </el-form-item>
    <el-form-item label="作者" prop="author">
      <el-input v-model="ruleForm.author"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="submitForm('ruleForm')">立即更新</el-button>
      <el-button @click="resetForm('ruleForm')">重置</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import axios from 'axios'

export default {
  name: 'UpdateBook',
  mounted () {
    let rowId = this.$route.query.id
    axios.get('http://localhost:8001/book/getBookById/' + rowId).then(resp => {
      console.log(resp)
      this.ruleForm = resp.data
    }).catch(error => {
      console.log(error)
    })
  },

  data () {
    return {
      ruleForm: {
        id : 0,
        name: '',
        author: ''
      },
      rules: {
        name: [
          {required: true, message: '请输入书籍名称', trigger: 'blur'},
          {min: 1, max: 100, message: '长度在 1 到 100 个字符', trigger: 'blur'}
        ],
        author: [
          {required: true, message: '请输入作者', trigger: 'blur'},
          {min: 1, max: 100, message: '长度在 1 到 100 个字符', trigger: 'blur'}
        ]
      }
    }
  },
  methods: {
    submitForm (formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          // alert('submit!')
          axios.post('http://localhost:8001/book/updateBook/', this.ruleForm).then(resp => {
            console.log(resp)
            if (resp.data) {
              this.$message.success('更新成功')
              this.$router.replace('/book')
            }
          }).catch(error => {
            console.log(error)
            this.$message.error('更新失败')
          })
        } else {
          // console.log('error submit!!')
          return false
        }
      })
    },
    resetForm (formName) {
      this.$refs[formName].resetFields()
    }
  }
}
</script>

<style scoped>

</style>
