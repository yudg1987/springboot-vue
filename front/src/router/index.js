import Vue from 'vue'
import Router from 'vue-router'
import Book from '../components/Book'
import AddBook from '../components/AddBook'
import Page3 from '../components/Page3'
import Page4 from '../components/Page4'
import Index from '../components/Index'
import UpdateBook from '../components/UpdateBook'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      component: Index,
      name: '书籍管理',
      redirect: 'book',
      show: true,
      children: [
        {
          path: '/book',
          name: '书籍列表',
          component: Book
        },
        {
          path: '/addbook',
          name: '添加数据',
          component: AddBook
        }
      ]
    },
    {
      path: '/updateBook',
      component: UpdateBook,
      show: false,
      name: '更新书籍'
    }
  ]
})
