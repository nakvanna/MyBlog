<template>
  <q-page class="image-background row items-center justify-evenly">
    <div class="full-width text-center">
      <div
        class="text-red-5 full-width font-nosifer"
        style="font-size: 36px"
      >
        Contact
      </div>
      <div
        class="full-width font-kdam-thmor text-grey"
      >
        សួស្ដីអ្នកគ្រប់គ្នា
      </div>
      <div class="row full-width q-pt-lg">
        <div class="col-xs-12 col-sm-4 col-md-4">
          <q-icon name="pin_drop" style="font-size: 4.4em;"/>
          <div class="font-play-ball" style="font-size: 26px">ADDRESS</div>
          <div class="font-metal-mania" style="font-size: 16px">Poipet, Banteay Meanchey Province</div>
        </div>
        <div class="col-xs-12 col-sm-4 col-md-4">
          <q-icon name="phone_iphone" style="font-size: 4.4em;"/>
          <div class="font-play-ball" style="font-size: 26px">PHONE</div>
          <div class="font-metal-mania" style="font-size: 16px">0969392312</div>
        </div>
        <div class="col-xs-12 col-sm-4 col-md-4">
          <q-icon name="contact_mail" style="font-size: 4.4em;"/>
          <div class="font-play-ball" style="font-size: 26px">EMAIL</div>
          <div class="font-metal-mania" style="font-size: 16px">nakvannamcu@gmail.com</div>
        </div>
      </div>
    </div>
  </q-page>
</template>

<script lang="ts">
import {defineComponent} from "@vue/composition-api";

export default defineComponent({
  name: "Contact"
})
</script>

<style scoped>

</style>
