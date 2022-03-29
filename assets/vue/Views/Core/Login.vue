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
      localStorage.setItem('blockAuth', true)
    } else {
      localStorage.setItem('blockAuth', false)
    }
  },
  methods: {
    async checkLogin() {
      if (JSON.parse(localStorage.getItem('blockAuth')) === false) {
        await axios.post(`${this.$api}login`, this.datas)
          .then(res => {
            if (res.status === 200) {
              this.$authToken = res.data.token;
              this.$refreshToken = res.data.refresh_token;
              if (this.$authToken != "") {
                this.login();
              }
            } else {
              this.error();
            }
          })
          .catch(() => {
            this.error();
          })
      } else if (JSON.parse(localStorage.getItem('blockAuth')) === true) {
        this.textSnack = "Erreur, contactez le support."
        this.snackPost = true;
        this.loged = false;
      }
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
    },
    async error() {
      await axios.get(`${this.$api}force_attacks.json?email=${this.datas.email}`)
        .then(res => {
          res.data[0].blocked == true ? localStorage.setItem('blockAuth', true) : localStorage.setItem('blockAuth', false);

          if (res.data[0].blocked != true) {
            if (res.data[0].count < 3) {
              this.patchForce(res.data[0], "nothing");
            } else if (res.data[0].count >= 3 && res.data[0].count <= 5) {
              this.patchForce(res.data[0], "warning")
            } else if (res.data[0].count > 5) {
              localStorage.setItem('blockAuth', true)
              this.patchForce(res.data[0], "block")
            }
          }
        })
        .catch(() => {
          this.setForce();
        })
      this.textSnack = "Erreur, vérifiez correctement vos informations."
      this.snackPost = true;
      this.loged = false;
    },
    async setForce() {
      await axios.post(`${this.$api}force_attacks`, {email: this.datas.email, count: 1, blocked: null})
    },
    async patchForce(forced, statusForce) {
      if (statusForce == "nothing" || statusForce == "warning") {
        await axios.put(`${this.$api}force_attacks/${forced.id}`, {email: forced.email, count: forced.count+= 1, blocked: null})
      } else if (statusForce == "block") {
        await axios.put(`${this.$api}force_attacks/${forced.id}`, {email: forced.email, count: forced.count, blocked: true})
      }
    },
  }
}
</script>