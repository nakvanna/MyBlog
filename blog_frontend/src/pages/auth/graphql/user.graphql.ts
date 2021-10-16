import gql from "graphql-tag";

export const userGraphql = gql`

  query UserGraphql($first: Int!,$condition: Json!){
    users(first: $first, condition: $condition){
      count
      edges{
        node{
          id
          profile
          name
          username
          email
          role
          verify
        }
      }
    }
  }

`
