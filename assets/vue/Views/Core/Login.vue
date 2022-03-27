<template>
  <v-app id="inspire">
    <h1>Connexion</h1>
    <v-form>
      <v-text-field v-model="datas.email" outlined label="Email" required type="email" :rules="[rules.required, rules.min]"></v-text-field>
      <v-text-field v-model="datas.password" @click:append="show = !show" outlined label="Mot de passe" required :append-icon="show ? 'mdi-eye' : 'mdi-eye-off'" :rules="[rules.required, rules.min]" :type="show ? 'text' : 'password'"></v-text-field>
      <v-btn outlined @click="checkLogin">Connexion</v-btn>
    </v-form>

    <v-snackbar v-model="snackPost" :timeout="timeoutSnack">
      {{ textSnack }}
      <template v-slot:action="{ attrs }">
        <v-btn :color="`${loged ? 'green' : 'red'}`" text v-bind="attrs" @click="snackPost = false">
          Fermer
        </v-btn>
      </template>
    </v-snackbar>
  </v-app>
</template>


<script>
import axios from 'axios';

export default {
  data() {
    return {
      datas: {
        email: "",
        password: ""
      },

      show: false,
      password: 'Password',
      rules: {
        required: value => !!value || 'Required.',
        min: v => v.length >= 3 || 'Min 3 characters',
      },

      loged: false,
      textSnack: "",
      snackPost: false,
      timeoutSnack: 1500,
    }
  },
  mounted() {
    if (this.$route.query.redirect && this.$route.query.redirect === "unauthorized") {
      this.textSnack = "Vous avez été redirigé en raison d'un manque d'information sécurisé."
      this.snackPost = true;
      this.loged = false;
    }
  },
  methods: {
    async checkLogin() {
      await axios.post(`${this.$api}login`, this.datas)
        .then(res => {
          this.$authToken = res.data.token;
          this.$refreshToken = res.data.refresh_token;
          if (this.$authToken != "") {
            this.login()
          }
        })
    },
    async login() {
      axios.defaults.headers.common = {'Authorization': `Bearer ${this.$authToken}`}
      await axios.get(`${this.$api}users.json?email=${this.datas.email}`)
        .then(res => {
          if (res.status === 200) {
            if (res.data[0].roles[0] !== "ROLE_USER" && res.data[0].roles[0] !== "") {
              this.$router.push({ name: 'Dashboard', query: { token: this.$authToken, user: res.data[0].email } })
            } else {
              this.textSnack = "Vous n'êtes pas autorisé."
              this.snackPost = true;
              this.loged = false;
            }
          }
        })
    }
  }
}
</script>