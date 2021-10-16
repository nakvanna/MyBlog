import {reactive} from "@vue/composition-api";
import {createUserGraphql} from "pages/auth/graphql/create-user.graphql";
import {loginUserGraphql} from "pages/auth/graphql/login-user.graphql";
import {UserModel} from "pages/auth/model/users.model";
import {useMutation} from "@vue/apollo-composable";
import {crudMessage} from "src/helpers/utils";

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
