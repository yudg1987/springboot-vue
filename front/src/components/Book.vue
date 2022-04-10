<template>
  <div>
    <table>
      <tr>
        <td>
          编号
        </td>
        <td>
          名称
        </td>
        <td>
          作者
        </td>
      </tr>
      <tr v-for=" (book,index) in books" :key="index">
        <td>
          {{ book.id }}
        </td>
        <td>
          {{ book.name }}
        </td>
        <td>
          {{ book.author }}
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'Book',
  data () {
    return {
      books: []
    }
  },
  mounted () {
    axios.get('http://localhost:8001/book/getBooks').then(resp => {
      console.log(resp)
      this.books = resp.data
    })
  }
}
</script>

<style scoped>

</style>
