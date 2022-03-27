<template>
  <div class="container_app">
    <v-app id="inspire">

      <app-nav></app-nav>

      <div class="container content pt-5">
        <router-view v-slot="{ Component }">
          <transition name="fade" mode="out-in" @after-leave="$root.$emit('mx::scroll::page')">
            <component :is="Component" />
          </transition>
        </router-view>
      </div>

    </v-app>
  </div>
</template>

<script>
import axios from 'axios';

import Nav from './../../Components/Nav.vue';

export default {
  components: {
    'app-nav': Nav
  },
  data() {
    return {
      
    }
  },
  methods: {

  }
}
</script>

<style>
  .custom-loader {
    animation: loader 1s infinite;
    display: flex;
  }
  @-moz-keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
  @-webkit-keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
  @-o-keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
  @keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
</style>