<template>
  <v-app id="inspire">
    <v-data-table
      :headers="headers"
      :items="users"
      sort-by="calories"
      class="elevation-1"
    >
      <template v-slot:top>
        <v-toolbar
          flat
        >
          <v-toolbar-title>Utilisateurs</v-toolbar-title>
          <v-divider
            class="mx-4"
            inset
            vertical
          ></v-divider>
          <v-spacer></v-spacer>
          <v-dialog
            v-model="dialog"
            max-width="500px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-btn
                color="primary"
                dark
                class="mb-2"
                v-bind="attrs"
                v-on="on"
                @click="newUser = true"
              >
                Nouvel utilisateur
              </v-btn>
            </template>
            <v-card v-if="!newUser">
              <v-card-title>
                <span class="text-h5">{{ formTitle }}</span>
              </v-card-title>

              <v-card-text>
                <v-container>
                  <v-row>
                    <v-col
                      cols="12"
                      sm="6"
                      md="4"
                    >
                      <v-text-field
                        v-model="editedItem.email"
                        label="Email"
                      ></v-text-field>
                    </v-col>
                    <v-col
                      cols="12"
                      sm="6"
                      md="4"
                    >
                      <v-select v-model="editedItem.roles" multiple :items="allRoles" chips label="Roles" outlined></v-select>
                    </v-col>
                  </v-row>
                </v-container>
              </v-card-text>

              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn
                  color="red darken-1"
                  text
                  @click="close"
                >
                  Annuler
                </v-btn>
                <v-btn
                  color="blue darken-1"
                  text
                  @click="save"
                >
                  Sauvegarder
                </v-btn>
              </v-card-actions>
            </v-card>

            <v-card v-if="newUser">
              <v-card-title>
                <span class="text-h5">{{ formTitle }}</span>
              </v-card-title>

              <v-card-text>
                <v-container>
                  <v-row>
                    <v-col
                      cols="12"
                      sm="6"
                      md="4"
                    >
                      <v-text-field
                        v-model="createdItem.email"
                        label="Email"
                      ></v-text-field>
                    </v-col>
                    <v-col
                      cols="12"
                      sm="6"
                      md="4"
                    >
                      <v-text-field
                        v-model="createdItem.password"
                        label="Mot de passe"
                      ></v-text-field>
                    </v-col>
                    <v-col
                      cols="12"
                      sm="6"
                      md="4"
                    >
                      <v-select v-model="createdItem.roles" multiple :items="allRoles" chips label="Roles" outlined></v-select>
                    </v-col>
                  </v-row>
                </v-container>
              </v-card-text>

              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn
                  color="red darken-1"
                  text
                  @click="close"
                >
                  Annuler
                </v-btn>
                <v-btn
                  color="blue darken-1"
                  text
                  @click="createItem"
                >
                  Sauvegarder
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>


          <v-dialog v-model="dialogDelete" max-width="800px">
            <v-card>
                <v-card-title class="text-h5">Êtes vous sur de vouloir supprimer cet utilisateur ?</v-card-title>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="red darken-1" text @click="closeDelete">Annuler</v-btn>
                <v-btn color="blue darken-1" text @click="deleteItemConfirm">OK</v-btn>
                <v-spacer></v-spacer>
              </v-card-actions>
            </v-card>
          </v-dialog>

        </v-toolbar>
      </template>
      <template v-slot:[`item.actions`]="{ item }">
        <v-icon small class="mr-2" @click="editItem(item)">
          mdi-pencil
        </v-icon>
        <v-icon small @click="deleteItem(item)">
          mdi-delete
        </v-icon>
      </template>
    </v-data-table>
  </v-app>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      users: [],
      token: "",
      headers: [
        {text: 'Id', value: 'id'},
        {text: 'Email', value: 'email'},
        {text: 'Roles', value: 'roles'},
        {text: 'Actions', value: 'actions', sortable: false},
      ],

      emailUpdate: "",
      dialog: false,
      dialogDelete: false,
      editedIndex: -1,
      editedItem: {
        email: "",
        roles: [],
      },
      defaultItem: {
        email: "",
        roles: [],
      },
      createdItem: {
        email: "",
        password: "",
        roles: ['ROLE_USER']
      },
      newUser: false,
      allRoles: [
        "ROLE_USER",
        "ROLE_ADMIN"
      ]
    }
  },
  mounted() {
    this.getToken();
  },
  computed: {
    formTitle () {
      return this.editedIndex === -1 ? 'Nouvel utilisateur' : 'Modification utilisateur'
    },
  },
  watch: {
    dialog (val) {
      val || this.close()
      val == false ? this.newUser = false : this.newUser = this.newUser
    },
    dialogDelete (val) {
      val || this.closeDelete()
    },
  },
  methods: {
    getToken() {
      if (this.$route.query.token !== "" && this.$route.query.token !== undefined && this.$route.query.token) {
        this.token = this.$route.query.token;
        this.fetchItems();
      } else {
        this.$router.push({ name: 'Login', query: { redirect: "unauthorized"} })
      }
    },
    async fetchItems() {
      axios.defaults.headers.common = {'Authorization': `Bearer ${this.token}`};

      await axios.get(`${this.$api}users.json`)
        .then(res => {
          if (res.status === 200) {
            this.users = res.data;
          }
        })
    },
    async updateItemSync(item) {
      axios.defaults.headers.common = {'Authorization': `Bearer ${this.token}`};
      await axios.put(`${this.$api}users/${item}`, this.editedItem).then(response => (this.fetchItems()));
      this.emailUpdate = "";
    },
    async deleteItemSync(item) {
      axios.defaults.headers.common = {'Authorization': `Bearer ${this.token}`};
      await axios.delete(`${this.$api}users/${item}`).then(response => (this.fetchItems()));
    },
    async createItem() {
      axios.defaults.headers.common = {'Authorization': `Bearer ${this.token}`};
      await axios.post(`${this.$api}users`, this.createdItem)
        .then(res => {
          if (res.status == 201) {
            this.dialog = false;
            this.fetchItems();
          }
        })
    },




    editItem (item) {
      this.editedIndex = this.users.indexOf(item)
      this.editedItem = Object.assign({}, item)
      this.dialog = true
    },

    deleteItem (item) {
      this.editedIndex = this.users.indexOf(item)
      this.editedItem = Object.assign({}, item)
      this.dialogDelete = true
    },

    deleteItemConfirm () {
      // this.users.splice(this.editedIndex, 1)
      this.deleteItemSync(this.users[this.editedIndex].id)
      this.closeDelete()
    },

    close () {
      this.dialog = false
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem)
        this.editedIndex = -1
      })
    },

    closeDelete () {
      this.dialogDelete = false
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem)
        this.editedIndex = -1
      })
    },

    save () {
      if (this.editedIndex > -1) {
        // Object.assign(this.users[this.editedIndex], this.editedItem)
        this.updateItemSync(this.users[this.editedIndex].id)
      } else {
        this.users.push(this.editedItem)
        console.log('create')
      }
      this.close()
    },
  }
}
</script>