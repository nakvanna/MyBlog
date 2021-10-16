defmodule BlogBackendWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern
  alias BlogBackend.{Accounts}

  def context(ctx) do
    loader =
      Dataloader.new
      |> Dataloader.add_source(Accounts, Accounts.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  ##Custom Scalar type
  import_types(
    BlogBackendWeb.Schema.Types.Custom.{JSON}
  )

  ##Query types
  import_types(
    BlogBackendWeb.Schema.Types.{
      User,
      Session
      }
  )

  ##Mutation types
  import_types(
    BlogBackendWeb.Schema.InputTypes.{
      User, Session
      }
  )

  ##Resolver type
  import_types(
    BlogBackendWeb.Schema.Resolvers.{
      User, Session
      }
  )

  # root query
  input_object :arg_condition do
    field :condition, :json
  end

  query do
    import_fields :user_queries
  end

  mutation do
    import_fields :session_mutations
    import_fields :user_mutations
  end

end