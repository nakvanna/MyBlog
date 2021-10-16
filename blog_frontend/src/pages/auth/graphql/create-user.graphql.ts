import gql from "graphql-tag";

export const createUserGraphql = gql `

  mutation CreateUser($data: CreateUserInputType!){
    createUser(data: $data){
      message
      success
    }
  }

`
