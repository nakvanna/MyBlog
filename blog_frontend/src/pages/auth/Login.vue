<template>
  <q-page class="q-ma-md">
    <q-toolbar class="bg-brown-5">
      <q-toolbar-title class="text-center text-bold ">
        ការចូលប្រើប្រាស់
        <div class="float-right">
          <q-btn to="/register" dense rounded outline>Register</q-btn>
        </div>
      </q-toolbar-title>
    </q-toolbar>
    <q-card class="q-pt-md">
      <q-card-section>
        <q-form
          @submit=""
          @reset="lgUser.md.user.clear()"
        >
          <q-input
            v-model="lgUser.state.user.data.email_or_username"
            label="Email or Username"
            lazy-rules
            :rules="[ val => val && val.length > 0 || 'Please type something']"
          />
          <q-input
            v-model="lgUser.state.user.data.password"
            label="Password"
            type="password"
            lazy-rules
            :rules="[ val => val && val.length > 0 || 'Please type something']"
          />
          <q-btn type="submit" rounded color="teal-5" class="full-width">Login</q-btn>
        </q-form>
      </q-card-section>
    </q-card>
  </q-page>
</template>

<script lang="ts">

import {reactive} from "@vue/composition-api";
import {loginUser} from "pages/auth/store/auth.store";

export default {
  name: "Login",
  setup: () => {
    const lgUser = loginUser()
    const state = reactive({})
    const md = {}
    return {
      state,
      md,
      lgUser
    }
  }
}
</script>

<style scoped>

</style>
