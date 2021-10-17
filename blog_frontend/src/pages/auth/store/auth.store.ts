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
            console.log(_err.message)
            if (_err.message === 'username_already_taken')
              crudMessage.errorMsg("Username ត្រូវបានគេជ្រើសរើស")
            else if (_err.message === 'email_already_taken')
              crudMessage.errorMsg("Email ត្រូវបានគេជ្រើសរើស")
            else
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
        mutationLogin.mutate({data})
          .then(res => {
            const userInfoAndToken = res?.data['login'] || null
            LocalStorage.set(LOGIN_INFO_KEY, userInfoAndToken)
            crudMessage.successMsg('Login បានជោគជ័យ!')
            setTimeout(() => window.location.reload(), 1000);
          })
          .catch(_err => {
            crudMessage.errorMsg('បរាជ័យក្នុងការ Login!')
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
