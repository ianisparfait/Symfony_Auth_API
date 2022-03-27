<template>
  <div class="nav">
    <v-app-bar
      color="deep-purple"
      dark
    >
      <v-app-bar-nav-icon @click="drawer = true"></v-app-bar-nav-icon>

      <v-toolbar-title>Cinéma F7</v-toolbar-title>
    </v-app-bar>
    <v-navigation-drawer v-model="drawer" absolute temporary>
      <v-list nav dense>
        <v-list-item-group v-model="group" active-class="deep-purple--text text--accent-4">
          <v-list-item v-for="(item, count) in entries" :key="`${count}`">
            <v-list-item-icon>
              <v-icon>{{item.icon}}</v-icon>
            </v-list-item-icon>

            <router-link :to="item.path" :name="item.name">
              <v-list-item-title>
                {{item.title}}
              </v-list-item-title>
            </router-link>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
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