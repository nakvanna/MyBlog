<template>
  <q-page class="row items-center justify-evenly">
    <div class="row full-width">
      <!--   HOME left path   -->
      <div class="col" style="margin-left: 150px; margin-top: 150px">
        <div>
          <div class="text-h5 text-bold">
            HELLO I'M <span class="text-red-4 underline">NAK VANNA</span>
          </div>

          <div class="text-h6 text-bold q-pt-sm underline">ប្រវត្ដិរូបសង្ខេប</div>
          <div>
            គោត្តនាម: <span class="text-green-5 text-bold">ណាក់ វណ្ណា</span>
            ភេទ: <span class="text-green-5 text-bold">ប្រុស</span>
            សញ្ជាតិ: <span class="text-green-5 text-bold">ខែ្មរ</span>
            ជនជាតិ: <span class="text-green-5 text-bold">ខែ្មរ</span>
            ឆ្នាំកំណើត: <span class="text-green-5 text-bold">១៩៩៧</span>
          </div>
          <div>
            ទីកន្លែងកំណើត ភូមិ: <span class="text-green-5 text-bold">ស្ពានកណ្ដោល</span>
            ឃុំ: <span class="text-green-5 text-bold">បវេល</span>
            ស្រុក: <span class="text-green-5 text-bold">បវេល</span>
            ខេត្ត: <span class="text-green-5 text-bold">បាត់ដំបង</span>
          </div>
          <div>
            កំពស់ : <span class="text-green-5 text-bold">១.៨៥ សង់ទីម៉ែត្រ</span>
          </div>
          <div>
            ទូរស័ព្ទទំនាក់ទំនង : <span class="text-green-5 text-bold">0969392312</span>
          </div>

          <div class="text-h6 text-bold q-pt-sm underline">កំរិតវប្បធម៌</div>
          <div>
            ២០១៥-២០១៨: <span class="text-green-5 text-bold">បរិញ្ញាបត្រ ព័ត៌មានវិទ្យា</span>
          </div>
          <div>
            ២០១២-២០១៥: <span class="text-green-5 text-bold">វិទ្យាល័យ</span>
          </div>
          <div>
            ២០០៩-២០១២: <span class="text-green-5 text-bold">អនុវិទ្យល័យ</span>
          </div>

          <div class="text-h6 text-bold q-pt-sm underline">ប្រវត្តិគ្រួសារ</div>
          <div>
            ស្ថានភាពគ្រួសារ : <span class="text-green-5 text-bold">នៅលីវ</span>
          </div>
          <div>
            ម្តាយឈ្មោះ : <span class="text-green-5 text-bold">ភេម សុភាព</span>
          </div>
          <div>
            ឪពុកឈ្មោះ : <span class="text-green-5 text-bold">មិត ណាក់</span>
          </div>
        </div>
      </div>

      <!--   HOME right path   -->
      <div class="col">
        <div class="text-center">
          <q-img src="../../assets/profile.png" width="85%"/>
        </div>
      </div>
    </div>
  </q-page>
</template>

<script lang="ts">
import {defineComponent, reactive} from "@vue/composition-api";

export default defineComponent({
  name: "Home",
  props: {},
  setup: () => {
    const state = reactive({
      tab: "home"
    })
    const md = {}
    return {
      state,
      md
    }
  }
})
</script>

<style scoped>
.underline {
  text-decoration: underline;
}
</style>
