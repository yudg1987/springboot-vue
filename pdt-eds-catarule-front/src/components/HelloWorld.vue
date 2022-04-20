<template>
  <div class="hello">
    <book></book>
  </div>
</template>

<script>
import Book from './Book'
export default {
  name: 'HelloWorld',
  components: {Book},
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
