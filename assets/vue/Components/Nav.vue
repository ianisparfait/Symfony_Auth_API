<template>
  <div class="nav" id="inspire">
    <v-app-bar
      color="deep-purple"
      dark
    >
      <v-app-bar-nav-icon @click="drawer = true" style="opacity: 0"></v-app-bar-nav-icon>

      <v-toolbar-title>Auth F7</v-toolbar-title>
    </v-app-bar>
  </div>
</template>

<script>
export default {
  data() {
    return {
      entries: [
        {title: "Accueil", icon: "mdi-home", path: "/", expansion: false, name: "Home"},
        // {title: "Compte", icon: "mdi-account", path: "/account", expansion: false, name: "Account"},
        {title: "Connexion", icon: "mdi-account", path: "/login", expansion: false, name: "Login"},
        // {title: "Inscription", icon: "mdi-account", path: "/register", expansion: false, name: "Register"},
        {title: "Ajouter un film", icon: "mdi-account", path: "/post-film", expansion: false, name: "Post"},
        {title: "Déconnexion", icon: "mdi-account", path: "/logout-out", expansion: false, name: "Logout"},
      ],
      categories: [
        {title: "Action"},
        {title: "Aventure"},
        {title: "Horreur"},
        {title: "Fantaisie"},
        {title: "Fatastique"},
        {title: "Comédie"},
        {title: "Épouvante"},
      ],
      drawer: false,
      group: null,
    }
  }
}
</script>