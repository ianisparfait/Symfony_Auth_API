import Vue from "vue";
import Application from './../vue/Views/App/Application.vue';
import vuetify from './../vue/Plugins/vuetifyImport.js';

import { router as r } from "../Router";

import './../styles/app.scss';

Vue.config.productionTip = false
Vue.prototype.$domain = `${window.location.protocol}/`
Vue.prototype.$api = `${window.location.protocol}/api/`
Vue.prototype.$jsonFormat = ".json"
Vue.prototype.$authToken = "";
Vue.prototype.$refreshToken = "";

new Vue({
  vuetify,
  router: r,
  render(h) {
    return h(Application)
  },
}).$mount('#app')