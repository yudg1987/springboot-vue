import Vue from 'vue'
import Router from 'vue-router'
import Book from '../components/Book'
import AddBook from '../components/AddBook'
import Page3 from '../components/Page3'
import Page4 from '../components/Page4'
import Index from '../components/Index'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      component: Index,
      name: '书籍管理',
      redirect: 'book',
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
      path: '/',
      component: Index,
      name: '导航2',
      children: [
        {
          path: '/page3',
          name: '页面3',
          component: Page3
        },
        {
          path: '/page4',
          name: '页面4',
          component: Page4
        }
      ]
    }
  ]
})
