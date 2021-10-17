<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar glossy class="bg-white text-black shadow-2 rounded-borders">
        <!--        left header-->
        <q-btn flat round dense icon="menu" class="q-mr-sm"/>
        <q-btn class="font-nosifer text-red" size="24px" flat label="LOGO"/>

        <!--        center header-->
        <q-tabs shrink>
          <q-route-tab class="font-metal-mania" to="/" exact replace label="HOME"/>
          <q-route-tab class="font-metal-mania" to="/about-us" exact replace label="ABOUT"/>
          <q-route-tab class="font-metal-mania" to="/contact-us" exact replace label="CONTACT"/>
          <q-route-tab class="font-metal-mania" to="/setting" exact replace label="SETTING"/>
        </q-tabs>

        <!--        right header-->
        <q-space/>
        <q-btn dense class="bg-grey-5" round icon="arrow_drop_down">
          <q-menu>
            <q-list style="min-width: 100px">
              <q-item clickable v-close-popup>
                <q-item-section>Settings</q-item-section>
              </q-item>
              <q-item clickable v-close-popup>
                <q-item-section>Help &amp; Feedback</q-item-section>
              </q-item>
              <q-separator/>
              <q-item @click="md.mainLayout.logout()" clickable v-close-popup>
                <q-item-section>Logout</q-item-section>
              </q-item>
            </q-list>
          </q-menu>
        </q-btn>
      </q-toolbar>
    </q-header>

    <q-page-container>
      <router-view/>
    </q-page-container>
  </q-layout>
</template>

<script lang="ts">

import {defineComponent, reactive} from "@vue/composition-api";

export default defineComponent({
  name: 'MainLayout',
  components: {},
  setup: () => {
    const state = reactive({})
    const md = {
      mainLayout: {
        logout: () => {
          localStorage.clear()
          setTimeout(() => window.location.reload(), 500);
        }
      }
    }

    return {
      state,
      md
    }
  }
});
</script>
