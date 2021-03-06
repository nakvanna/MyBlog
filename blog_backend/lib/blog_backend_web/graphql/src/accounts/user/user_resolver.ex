defmodule BlogBackendWeb.Schema.Resolvers.User do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern
  alias BlogBackend.Accounts

  # connection for relay
  connection node_type: :user do
    field :count, :integer
    # must include edge
    edge do
    end
  end

  object :user_queries do
    connection field :users, node_type: :user do
      arg :condition, non_null(:json)
      #      middleware BlogBackendWeb.Graphql.Middleware, ["user"]
      resolve(
        fn args, _
        ->
          Accounts.list_users(args)
        end
      )
    end

    field :find_user, :user do
      arg :id, :id
      middleware BlogBackendWeb.Graphql.Middleware, ["user"]
      resolve(
        fn args, _ ->
          case Accounts.get_user(args.id) do
            nil -> {:error, "User ID #{args.id} not found!"}
            user -> {:ok, user}
          end
        end
      )
    end
  end

  object :user_mutations do
    field :create_user, :user do
      arg :data, non_null(:create_user_input_type)
      resolve(
        fn args, _ ->
          Accounts.create_user(args.data)
        end
      )
    end

    field :update_user, :user do
      arg :id, :id
      arg :data, :update_user_input_type
      middleware BlogBackendWeb.Graphql.Middleware, ["user"]
      resolve(
        fn args, _ ->
          user = Accounts.get_user(args.id)
          if user == nil do
            {:error, %{success: false, message: "No result found to update!"}}
          else
            Accounts.update_user(user, args.data)
          end
        end
      )
    end

    field :delete_user, :user do
      arg :id, :id
      middleware BlogBackendWeb.Graphql.Middleware, ["user"]
      resolve(
        fn args, _ ->
          user = Accounts.get_user(args.id)
          if user == nil do
            {:error, %{success: false, message: "No result found to delete!"}}
          else
            Accounts.delete_user(user)
          end
        end
      )
    end
  end

end