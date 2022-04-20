<template>
  <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" >
    <el-form-item label="书籍名称" prop="name">
      <el-input v-model="ruleForm.name"></el-input>
    </el-form-item>
    <el-form-item label="作者" prop="author">
      <el-input v-model="ruleForm.author"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
      <el-button @click="resetForm('ruleForm')">重置</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import axios from 'axios'

export default {
  name: 'AddBook',

  data () {
    return {
      ruleForm: {
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
          axios.post('http://localhost:8001/book/addBook/', this.ruleForm).then(resp => {
            console.log(resp)
            if (resp.data) {
              this.$message.success('添加成功')
              this.$router.replace('/book')
            }
          }).catch(error => {
            console.log(error)
            this.$message.error('添加失败')
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
