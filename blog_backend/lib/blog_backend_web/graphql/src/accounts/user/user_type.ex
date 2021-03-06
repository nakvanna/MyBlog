defmodule BlogBackendWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :profile, :string
    field :name, :string
    field :username, :string
    field :email, :string
    field :role, :string
    field :verify, :boolean
    field :success, :boolean
    field :message, :string
  end

end