import {RouteConfig} from 'vue-router';

const routes: RouteConfig[] = [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      {path: '', component: () => import('pages/home/Home.vue'), meta: {requireAuth: true}},
      {path: 'about-us', component: () => import('pages/about/About.vue'), meta: {requireAuth: true}},
      {path: 'contact-us', component: () => import('pages/contact/Contact.vue'), meta: {requireAuth: true}},
    ],

  },

  ///Authentication
  {
    path: '/register',
    component: () => import('layouts/AuthLayout.vue'),
    children: [{path: '', component: () => import('pages/auth/Register.vue')}],
  }, {
    path: '/login',
    component: () => import('layouts/AuthLayout.vue'),
    children: [{path: '', component: () => import('pages/auth/Login.vue')}],
  },

  // Always leave this as last one,
  // but you can also remove it
  {
    path: '*',
    component: () => import('pages/Error404.vue')
  }
];

export default routes;
