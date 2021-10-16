<template>
  <q-page
    class="q-ma-md"
  >
    <div class="full-width" style="padding-top: 50px">
      <div class="row justify-center text-center">
        <!--        left section-->
        <div
          class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 my-div-left"
          style="padding-top: 100px"
        >
          <div class="font-nosifer text-red-5" style="font-size: 36px">
            Blogger
          </div>
          <div class="font-play-ball" style="font-size: 28px">
            Connect with friends and the world around you on <span class="text-red-5">Blogger</span>.
          </div>

        </div>

        <!--        Right section-->
        <div
          class="col-xs-12 col-sm-12 col-md col-lg col-xl">
          <div class="row my-div-right" style="padding-top: 80px;">
            <q-card style="width: 350px">
              <q-card-section>
                <q-form
                  @submit=""
                  @reset="lgUser.md.user.clear()"
                >
                  <q-input
                    outlined
                    v-model="lgUser.state.user.data.email_or_username"
                    label="Email or Username"
                    lazy-rules
                    :rules="[ val => val && val.length > 0 || 'Please type something']"
                  />
                  <q-input
                    outlined
                    v-model="lgUser.state.user.data.password"
                    label="Password"
                    type="password"
                    lazy-rules
                    :rules="[ val => val && val.length > 0 || 'Please type something']"
                  />
                  <q-btn
                    type="submit"
                    rounded color="teal-5"
                    class="full-width font-play-ball"
                  >Login
                  </q-btn>
                </q-form>
              </q-card-section>
              <q-separator/>
              <q-card-actions>
                <q-space/>
                <q-btn
                  @click="state.dialog.create = true"
                  color="blue" class="font-play-ball"
                  flat label="Register"
                >
                  <RegisterDialog v-model="state.dialog.create"/>
                </q-btn>
              </q-card-actions>
            </q-card>
          </div>
        </div>
      </div>

      <!--      footer    -->
      <div class="row text-center">
        <q-footer class="bg-white text-black q-pa-md" elevated>
          <div class="full-width font-play-ball text-h6">
            POLICIES
          </div>
          <div class="full-width font-play-ball">
            Fantastic value! I'm not sure how I'd do without it. It’s worth its weight in gold and paid back for itself
            many times.
          </div>
        </q-footer>
      </div>
    </div>
  </q-page>
</template>

<script lang="ts">

import {reactive} from "@vue/composition-api";
import {loginUser} from "pages/auth/store/auth.store";
import RegisterDialog from "pages/auth/RegisterDialog.vue";

export default {
  name: "Login",
  components: {RegisterDialog},
  setup: () => {
    const lgUser = loginUser()
    const state = reactive({
      dialog: {
        create: false
      }
    })
    const md = {}
    return {
      state,
      md,
      lgUser
    }
  }
}
</script>

<style lang="sass" scoped>
.my-div-left
  body.screen--xs &
    padding-top: 10px !important

  body.screen--sm &
    padding-top: 20px !important

.my-div-right
  body.screen--xs &
    justify-items: center
    justify-content: center
    align-content: center
    align-items: center
    padding-top: 30px !important

  body.screen--sm &
    justify-items: center
    justify-content: center
    align-content: center
    align-items: center
    padding-top: 30px !important

</style>
