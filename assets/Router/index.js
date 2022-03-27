import VueRouter from 'vue-router';
Vue.use(VueRouter)


// Pages App

// Pages Core
import Login from './../vue/Views/Core/Login.vue';

// Admin
import Dashboard from './../vue/Admin/Views/Dashboard.vue';
import Vue from 'vue';


const routes = [
  { path: '/', component: Login, name: "Login" },
  { path: '/dashboard', component: Dashboard, name: "Dashboard", props: true },
]

const router = new VueRouter({
  routes // short for `routes: routes`
})


export { router };