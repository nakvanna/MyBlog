<template>
  <div id="q-app">
    <router-view/>
  </div>
</template>

<script lang="ts">
import {defineComponent, provide} from '@vue/composition-api';
import {DefaultApolloClient} from "@vue/apollo-composable";
import {ApolloClient, ApolloLink, concat, HttpLink, InMemoryCache} from "@apollo/client/core";
import {LocalStorage} from 'quasar'
import {LOGIN_INFO_KEY} from "src/helpers/utils";

const cache = new InMemoryCache({
  addTypename: false,
})

let userInfo = <any>LocalStorage.getItem(LOGIN_INFO_KEY)


const httpLink = new HttpLink({uri: 'http://127.0.0.1:4000/graphql'});

const authMiddleware = new ApolloLink((operation, forward) => {

  operation.setContext(({headers = {}}) => ({
    headers: {
      ...headers,
      authorization: `Bearer ${userInfo ? userInfo['token'] : ''}`
    }
  }));

  return forward(operation);
})

const apolloClient = new ApolloClient({
  link: userInfo ? concat(authMiddleware, httpLink) : httpLink,
  cache
})

export default defineComponent({
  name: 'App',
  setup() {
    provide(DefaultApolloClient, apolloClient)
  },
});
</script>
