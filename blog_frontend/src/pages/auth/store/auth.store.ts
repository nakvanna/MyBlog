import {reactive} from "@vue/composition-api";
import {createUserGraphql} from "pages/auth/graphql/create-user.graphql";
import {loginUserGraphql} from "pages/auth/graphql/login-user.graphql";
import {LoginUserModel, UserModel} from "pages/auth/model/users.model";
import {useMutation} from "@vue/apollo-composable";
import {cleanObject, crudMessage, LOGIN_INFO_KEY} from "src/helpers/utils";
import {LocalStorage} from "quasar";

const userGraphqlState = {
  userQueryDoc: {
    registerUser: createUserGraphql,
    loginUser: loginUserGraphql,
  }
}

export function registerUser() {
  const state = reactive({
    user: {
      data: <UserModel>{}
    }
  })
  const md = {
    user: {
      create: () => {
        const data = JSON.parse(JSON.stringify(state.user.data))
        mutateUser.mutate({data})
          .then(_res => {
            crudMessage.successCreate()
          })
          .catch(_err => {
            crudMessage.errorCreate()
          })
      },
      clear: () => {

      }
    }
  }

  //mutates
  const mutateUser = useMutation(userGraphqlState.userQueryDoc.registerUser)
  return {
    state,
    md
  }
}

export function loginUser() {
  const state = reactive({
    user: {
      data: <LoginUserModel>{}
    }
  })

  const md = {
    user: {
      login: () => {
        const data = cleanObject(state.user.data)
        console.log(data)
        mutationLogin.mutate({data})
          .then(res => {
            const userInfoAndToken = res?.data['login'] || null
            LocalStorage.set(LOGIN_INFO_KEY, userInfoAndToken)
            window.location.reload()
            crudMessage.successMsg('ចូលបានជោគជ័យ!')
          })
          .catch(_err => {
            crudMessage.errorMsg('បរាជ័យក្នុងការចូល!')
          })
      },
      clear: () => {

      }
    }
  }

  const mutationLogin = useMutation(userGraphqlState.userQueryDoc.loginUser)

  return {
    state,
    md
  }
}
