<template>
  <q-page class="row q-ma-md justify-center">
    <div class="col-xs-12 col-sm col-md col-md"></div>

    <div
      class="col-xs-12 col-sm-8 col-md-7 col-lg-5 col-xl-5"
    >
      <q-card class="q-pt-md">
        <q-card-section>
          <div class="text-h6 font-nosifer">Register</div>
          <div class="text-subtitle2">
            <q-btn to="/login" class="font-play-ball" size=".8rem" dense flat color="blue">Login</q-btn>
          </div>
        </q-card-section>

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
    </div>

    <div class="col-xs-12 col-sm col-md col-md"></div>

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
