<template>
  <q-page class="q-ma-md">
    <q-toolbar class="bg-brown-5">
      <q-toolbar-title class="text-center text-bold ">
        ការចុះឈ្មោះ
        <div class="float-right">
          <q-btn to="/login" dense rounded outline>Login</q-btn>
        </div>
      </q-toolbar-title>
    </q-toolbar>
    <q-card class="q-pt-md">
      <q-card-section>
        <q-form
          @submit="crUser.md.user.create()"
          @reset="crUser.md.user.clear()"
        >
          <q-input
            v-model="crUser.state.user.data.name"
            label="Name"
            lazy-rules
            :rules="[ val => val && val.length > 0 || 'Please type something']"
          />
          <q-input
            v-model="crUser.state.user.data.username"
            label="Username"
            lazy-rules
            :rules="[ val => val && val.length > 0 || 'Please type something']"
          />
          <q-input
            v-model="crUser.state.user.data.email"
            label="E-mail"
            lazy-rules
            :rules="[ val => val && val.length > 0 || 'Please type something']"
          />
          <q-input
            v-model="crUser.state.user.data.password"
            label="Password"
            type="password"
            lazy-rules
            :rules="[ val => val && val.length > 0 || 'Please type something']"
          />
          <q-input
            v-model="crUser.state.user.data.password_confirmation"
            label="Confirm password"
            type="password"
            lazy-rules
            :rules="[ val => val && val.length > 0 || 'Please type something']"
          />
          <q-btn type="submit" rounded color="teal-5" class="full-width">Register</q-btn>
        </q-form>
      </q-card-section>
    </q-card>
  </q-page>
</template>

<script lang="ts">

import {defineComponent, reactive} from "@vue/composition-api";
import {registerUser} from "pages/auth/store/auth.store";

export default defineComponent({
  name: "Register",
  setup: () => {
    const crUser = registerUser()
    const state = reactive({})
    const md = {}
    return {
      state,
      md,
      crUser
    }
  }
})
</script>

<style scoped>

</style>
