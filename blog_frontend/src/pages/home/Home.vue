<template>
  <q-page class="image-background row items-center">
    <div class="row full-width q-py-lg">
      <div class="col-xs-12 col-sm col-md col-md"></div>

      <div
        class="col-xs-12 col-sm-8 col-md-7 col-lg-5 bg-white shadow-2 rounded-borders"
      >
        <q-list :key="item_key" bordered v-for="(item, item_key) in state.data">
          <q-item clickable v-ripple>
            <div>
              <div class="row full-width">
                <q-avatar class="q-pa-md">
                  <q-img :src="item.user.profile"/>
                </q-avatar>
                <div
                  class="font-metal-mania q-pt-md q-pl-lg"
                  style="font-size: 24px"
                >
                  {{ item.user.name }}
                </div>
              </div>
              <div class="q-pa-md" v-html="item.title"/>
              <div class="q-pa-md">
                <q-card v-if="item.images.length === 1">
                  <q-img
                    v-for="(img, img_key) in item.images"
                    :key="img_key"
                    class="image-1"
                    :src="img"
                  >
                    <div
                      class="font-koulen absolute-bottom-right text-subtitle2 text-right"
                      style="font-size: 16px"
                    >
                      {{ item.images.length }}
                    </div>
                  </q-img>
                </q-card>
                <q-card class="row q-gutter-xs q-pr-xs q-pb-xs" v-if="item.images.length === 2">
                  <q-img
                    v-for="(img, img_key) in item.images"
                    :key="img_key"
                    class="image-2 col"
                    :ratio="1/2"
                    :src="img"
                  >
                    <div
                      v-if="img_key === 1"
                      class="font-koulen absolute-bottom-right text-subtitle2 text-right"
                      style="font-size: 16px"
                    >
                      {{ item.images.length }}
                    </div>
                  </q-img>
                </q-card>
                <q-card class="row q-gutter-xs q-pr-xs q-pb-xs" v-if="item.images.length === 3">
                  <q-img
                    class="image-2 col q-pb-md"
                    :ratio="1/2"
                    :src="item.images[0]"
                  />

                  <div class="col">
                    <q-img
                      class="image-4"
                      :src="item.images[1]"
                    />
                    <q-img
                      class="image-4"
                      :src="item.images[2]"
                    >
                      <div
                        class="font-koulen absolute-bottom-right text-subtitle2 text-right"
                        style="font-size: 16px"
                      >
                        {{ item.images.length }}
                      </div>
                    </q-img>
                  </div>

                </q-card>
                <q-card class="row q-gutter-xs q-pr-xs q-pb-xs" v-if="item.images.length === 4">
                  <div class="col">
                    <q-img
                      class="image-4"
                      :src="item.images[0]"
                    />
                    <q-img
                      class="image-4"
                      :src="item.images[1]"
                    />
                  </div>
                  <div class="col">
                    <q-img
                      class="image-4"
                      :src="item.images[2]"
                    />
                    <q-img
                      class="image-4"
                      :src="item.images[3]"
                    >
                      <div
                        class="font-koulen absolute-bottom-right text-subtitle2 text-right"
                        style="font-size: 16px"
                      >
                        {{ item.images.length }}
                      </div>
                    </q-img>
                  </div>
                </q-card>
                <q-card class="row q-gutter-xs q-pr-xs q-pb-xs" v-if="item.images.length > 4">
                  <div class="col">
                    <q-img
                      class="image-4"
                      :src="item.images[0]"
                    />
                    <q-img
                      class="image-4"
                      :src="item.images[1]"
                    />
                  </div>
                  <div class="col">
                    <q-img
                      class="image-4"
                      :src="item.images[2]"
                    />
                    <q-img
                      class="image-4"
                      :src="item.images[3]"
                    >
                      <div
                        class="font-koulen absolute-bottom-right text-subtitle2 text-right"
                        style="font-size: 16px"
                      >
                        {{ item.images.length }}
                      </div>
                    </q-img>
                  </div>
                </q-card>
              </div>

              <!--     Like comment share         -->
              <div class="row justify-center text-center full-width">
                <div class="col-4">
                  <!--                  <q-btn round color="primary" icon="mdi-heart"/>-->
                  <q-btn flat round color="primary" icon="mdi-heart-outline"/>
                  3.4k
                </div>
                <div class="col-4">
                  <!--                  <q-btn round color="primary" icon="mdi-message"/>-->
                  <q-btn flat round color="primary" icon="mdi-message-outline"/>
                  1k
                </div>
                <div class="col-4">
                  <!--                  <q-btn round color="primary" icon="mdi-share"/>-->
                  <q-btn flat round color="primary" icon="mdi-share-outline"/>
                  500
                </div>
              </div>
            </div>
          </q-item>

        </q-list>

      </div>

      <div class="col-xs-12 col-sm col-md col-md"></div>
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
      data: [
        {
          title: "All human beings are born free & equal in dignity & rights. That’s why we are acting together to end\n" +
            "persistent poverty, respect all people & our planet. #BreakTheCycle http://bit.ly/UNIDEP2021 ",
          images: [
            'https://cdn.quasar.dev/img/parallax2.jpg'
          ],
          user: {
            name: "Nak Nanna",
            username: "nakvanna",
            profile: "https://pbs.twimg.com/profile_images/1121942926437666816/Ck65AlxH_400x400.jpg"
          }
        },
        {
          title: "All human beings are born free & equal in dignity & rights. That’s why we are acting together to end\n" +
            "persistent poverty, respect all people & our planet. #BreakTheCycle http://bit.ly/UNIDEP2021 ",
          images: [
            'https://cdn.quasar.dev/img/parallax2.jpg',
            'https://cdn.quasar.dev/img/mountains.jpg',
          ],
          user: {
            name: "Chorn Khemra",
            username: "chornkhemra",
            profile: "https://cdn.quasar.dev/img/avatar.png"
          }
        },
        {
          title: "All human beings are born free & equal in dignity & rights. That’s why we are acting together to end\n" +
            "persistent poverty, respect all people & our planet. #BreakTheCycle http://bit.ly/UNIDEP2021 ",
          images: [
            'https://cdn.quasar.dev/img/parallax1.jpg',
            'https://cdn.quasar.dev/img/mountains.jpg',
            'https://cdn.quasar.dev/img/parallax2.jpg',
          ],
          user: {
            name: "Mjaz Srok",
            username: "mjazsrok",
            profile: "https://cdn.quasar.dev/img/avatar.png"
          }
        },
        {
          title: "All human beings are born free & equal in dignity & rights. That’s why we are acting together to end\n" +
            "persistent poverty, respect all people & our planet. #BreakTheCycle http://bit.ly/UNIDEP2021 ",
          images: [
            'https://cdn.quasar.dev/img/parallax1.jpg',
            'https://cdn.quasar.dev/img/mountains.jpg',
            'https://cdn.quasar.dev/img/mountains.jpg',
            'https://cdn.quasar.dev/img/parallax2.jpg',
          ],
          user: {
            name: "Mjaz Srok",
            username: "mjazsrok",
            profile: "https://cdn.quasar.dev/img/avatar.png"
          }
        },
        {
          title: "All human beings are born free & equal in dignity & rights. That’s why we are acting together to end\n" +
            "persistent poverty, respect all people & our planet. #BreakTheCycle http://bit.ly/UNIDEP2021 ",
          images: [
            'https://cdn.quasar.dev/img/parallax1.jpg',
            'https://cdn.quasar.dev/img/mountains.jpg',
            'https://cdn.quasar.dev/img/mountains.jpg',
            'https://cdn.quasar.dev/img/parallax2.jpg',
            'https://cdn.quasar.dev/img/parallax2.jpg',
            'https://cdn.quasar.dev/img/parallax2.jpg',
            'https://cdn.quasar.dev/img/parallax2.jpg',
          ],
          user: {
            name: "Mjaz Srok",
            username: "mjazsrok",
            profile: "https://cdn.quasar.dev/img/avatar.png"
          }
        },
      ]
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
.image-1 {
  width: 100%;
  height: 350px;
}

.image-2 {
  width: 50%;
  height: 350px;
}

.image-3 {
  width: 50%;
  height: 350px;
}

.image-4 {
  width: 100%;
  height: 175px;
}

</style>
