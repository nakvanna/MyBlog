<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar class="bg-white text-black shadow-2 rounded-borders">
        <q-btn class="font-nosifer" size="24px" flat label="LOGO"/>
        <q-space/>
        <q-tabs shrink>
          <q-route-tab class="font-metal-mania" to="/" exact replace label="HOME"/>
          <q-route-tab class="font-metal-mania" to="/about-us" exact replace label="ABOUT"/>
          <q-route-tab class="font-metal-mania" to="/contact-us" exact replace label="CONTACT"/>
        </q-tabs>
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
    const md = {}

    return {
      state,
      md
    }
  }
});
</script>
