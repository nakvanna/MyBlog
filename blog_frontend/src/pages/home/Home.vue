<template>
  <q-page class="row items-center justify-evenly">
    <div class="row full-width">
      <!--   HOME left path   -->
      <div class="col-xs-12 col-sm-6 col-md-6 text-center ">
        <div class="justify-center float-right q-pt-md">
          <div style="font-size: 24px" class="text-bold font-nosifer">
            HELLO
          </div>

          <div style="font-size: 54px" class="text-bold font-play-ball">
            I'm <span class="text-red-4 underline text-bold">Nak Vanna</span>
          </div>

          <div
            class="text-h6 text-bold q-py-md underline font-koulen"
            style="font-size: 24px"
          >
            ប្រវត្ដិរូបសង្ខេប
          </div>
          <div
            class="font-preahvihear"
            style="font-size: 16px"
          >
            គោត្តនាម: <span class="text-green-5 text-bold">ណាក់ វណ្ណា</span>
            ភេទ: <span class="text-green-5 text-bold">ប្រុស</span>
            សញ្ជាតិ: <span class="text-green-5 text-bold">ខែ្មរ</span>
            ជនជាតិ: <span class="text-green-5 text-bold">ខែ្មរ</span>
            ឆ្នាំកំណើត: <span class="text-green-5 text-bold">១៩៩៧</span>
          </div>
          <div class="font-preahvihear q-pt-sm">
            ទីកន្លែងកំណើត
          </div>
          <div class="font-preahvihear">
            ភូមិ: <span class="text-green-5 text-bold">ស្ពានកណ្ដោល</span>
            ឃុំ: <span class="text-green-5 text-bold">បវេល</span>
            ស្រុក: <span class="text-green-5 text-bold">បវេល</span>
            ខេត្ត: <span class="text-green-5 text-bold">បាត់ដំបង</span>
          </div>
          <div class="font-preahvihear">
            កំពស់ : <span class="text-green-5 text-bold">១.៨៥ សង់ទីម៉ែត្រ</span>
          </div>
          <div class="font-preahvihear">
            ទូរស័ព្ទទំនាក់ទំនង : <span class="text-green-5 text-bold">0969392312</span>
          </div>

          <div
            class="text-h6 text-bold q-py-md underline font-koulen"
            style="font-size: 24px"
          >
            កំរិតវប្បធម៌
          </div>
          <div
            class="font-preahvihear"
            style="font-size: 16px"
          >
            ២០១៥-២០១៨: <span class="text-green-5 text-bold">បរិញ្ញាបត្រ ព័ត៌មានវិទ្យា</span>
          </div>
          <div
            class="font-preahvihear"
            style="font-size: 16px"
          >
            ២០១២-២០១៥: <span class="text-green-5 text-bold">វិទ្យាល័យ</span>
          </div>
          <div
            class="font-preahvihear"
            style="font-size: 16px"
          >
            ២០០៩-២០១២: <span class="text-green-5 text-bold">អនុវិទ្យល័យ</span>
          </div>

          <div
            class="text-h6 text-bold q-py-md underline font-koulen"
            style="font-size: 24px"
          >
            ប្រវត្តិគ្រួសារ
          </div>
          <div
            class="font-preahvihear"
            style="font-size: 16px"
          >
            ស្ថានភាពគ្រួសារ : <span class="text-green-5 text-bold">នៅលីវ</span>
          </div>
          <div
            class="font-preahvihear"
            style="font-size: 16px"
          >
            ម្តាយឈ្មោះ : <span class="text-green-5 text-bold">ភេម សុភាព</span>
          </div>
          <div
            class="font-preahvihear"
            style="font-size: 16px"
          >
            ឪពុកឈ្មោះ : <span class="text-green-5 text-bold">មិត ណាក់</span>
          </div>
        </div>
      </div>

      <!--   HOME right path   -->
      <div class="col-xs-12 col-sm-6 col-md-6 justify-start">
        <div class="text-center float-left">
          <q-img src="../../assets/profile.png" width="450px"/>
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
