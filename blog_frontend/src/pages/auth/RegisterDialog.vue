<template>
  <q-dialog v-model="state.dialog.show">
    <q-card style="width: 450px">
      <q-card-section>
        <div class="text-h6 font-nosifer">Register</div>
      </q-card-section>
      <q-separator/>
      <q-card-section>
        <q-form
          @submit="crUser.md.user.create()"
          @reset=""
        >
          <q-input
            outlined
            v-model="crUser.state.user.data.name"
            label="Name"
            lazy-rules
            :rules="[ val => val && val.length > 0 || 'Please type something']"
          />
          <q-input
            outlined
            v-model="crUser.state.user.data.username"
            label="Username"
            lazy-rules
            :rules="[ val => val && val.length > 0 || 'Please type something']"
          />
          <q-input
            outlined
            v-model="crUser.state.user.data.email"
            label="E-mail"
            lazy-rules
            :rules="[ val => val && val.length > 0 || 'Please type something']"
          />
          <q-input
            outlined
            v-model="crUser.state.user.data.password"
            label="Password"
            type="password"
            lazy-rules
            :rules="[ val => val && val.length > 0 || 'Please type something']"
          />
          <q-input
            outlined
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
  </q-dialog>
</template>

<script lang="ts">
import {computed, defineComponent, reactive} from "@vue/composition-api";
import {registerUser} from "pages/auth/store/auth.store";

export default defineComponent({
  name: "RegisterDialog",
  props: {
    value: {
      type: Boolean,
      default: false,
    }
  },
  setup: (props: any, ctx) => {
    const crUser = registerUser()
    const state = reactive({
      dialog: {
        show: computed({
          get: () => props.value,
          set: (val) => ctx.emit('input', val)
        })
      }
    })
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
