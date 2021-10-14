import {RouteConfig} from 'vue-router';

const routes: RouteConfig[] = [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      {path: '', component: () => import('pages/home/Home.vue')},
      {path: 'about-us', component: () => import('pages/about/About.vue')},
      {path: 'contact-us', component: () => import('pages/contact/Contact.vue')},
    ]
  },

  // Always leave this as last one,
  // but you can also remove it
  {
    path: '*',
    component: () => import('pages/Error404.vue')
  }
];

export default routes;
