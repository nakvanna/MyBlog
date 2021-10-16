<template>
  <q-page class="image-background row items-center">
    <div class="row full-width q-py-sm">
      <div class="col-xs-12 col-sm col-md col-md"></div>

      <div
        class="col-xs-12 col-sm-8 col-md-7 col-lg-5 col-xl-5  bg-white shadow-2 rounded-borders"
      >

        <q-list :key="item_key" bordered v-for="(item, item_key) in lsPost.state.post.data.records">
          <q-item>
            <div>
              <!--    content section       -->
              <q-item>
                <q-item-section class="justify-content-start" avatar>
                  <q-avatar size="3rem">
                    <q-img :src="item.user.profile"/>
                  </q-avatar>
                </q-item-section>
                <q-item-section>
                  <q-item-label style="font-size: 24px" class="font-metal-mania">{{ item.user.name }}</q-item-label>
                  <q-item-label caption lines="2">{{ 12 }}h</q-item-label>
                </q-item-section>
              </q-item>
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

              <!--     Like comment share section        -->
              <q-separator/>
              <div class="row justify-center text-center full-width">
                <div class="col-4">
                  <!--                  <q-btn round color="primary" icon="mdi-heart"/>-->
                  <q-btn flat round color="primary" icon="mdi-heart-outline"/>
                  <span class="font-play-ball">{{ 3.4 }}k</span>
                </div>
                <div class="col-4">
                  <!--                  <q-btn round color="primary" icon="mdi-message"/>-->
                  <q-btn flat round color="primary" icon="mdi-message-outline"/>
                  <span class="font-play-ball">{{ 1.4 }}k</span>
                </div>
                <div class="col-4">
                  <!--                  <q-btn round color="primary" icon="mdi-share"/>-->
                  <q-btn flat round color="primary" icon="mdi-share-outline"/>
                  <span class="font-play-ball">{{ 102 }}</span>
                </div>
              </div>
              <q-separator/>
              <!--    Comments section          -->
              <div class="row full-width">
                <q-list :key="cmt_index" v-for="(cmt, cmt_index) in item.comments" class="full-width">
                  <q-item>
                    <q-item-section class="justify-content-start" avatar>
                      <q-avatar size="2rem">
                        <q-img :src="cmt.user.profile"/>
                      </q-avatar>
                    </q-item-section>
                    <q-item-section>
                      <q-item-label class="font-preahvihear">{{ cmt.user.name }}</q-item-label>
                      <q-item-label caption lines="2">{{ cmt.comment }}</q-item-label>
                      <q-item-label>
                        <div class="col-4">
                          <!--                  <q-btn round color="primary" icon="mdi-message"/>-->
                          <q-btn size=".7rem" flat round label="Reply"/>
                          <q-btn size=".7rem" flat round icon="mdi-heart-outline"/>
                          <span style="font-size: 12px" class="font-play-ball">{{ cmt.like }}</span>
                        </div>
                      </q-item-label>
                    </q-item-section>
                  </q-item>
                </q-list>
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
import {listPost} from "pages/home/store/home.store";

export default defineComponent({
  name: "Home",
  props: {},
  setup: () => {
    const lsPost = listPost()
    const state = reactive({})
    const md = {}
    return {
      state,
      md,
      lsPost
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

.image-4 {
  width: 100%;
  height: 175px;
}

.justify-content-start {
  justify-content: start
}
</style>
