import Vue from 'vue'
import Router from 'vue-router'

import Landing    from '@/views/v_landing'
import About      from '@/views/v_about'
import Contact    from '@/views/v_contact'
import Services   from '@/views/v_services'
import Work       from '@/views/v_work'



Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Landing',
      component: Landing
    },
    {
      path: '/about',
      name: 'About',
      component: About
    },
    {
      path: '/contact',
      name: 'Contact',
      component: Contact
    },
    {
      path: '/services',
      name: 'Services',
      component: Services
    },
    {
      path: '/work',
      name: 'Work',
      component: Work
    }
  ]
})
