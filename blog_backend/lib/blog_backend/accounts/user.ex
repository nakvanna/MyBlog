defmodule BlogBackend.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :profile, :string
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :username, :string
    field :role, :string, default: "user"
    field :verify, :boolean, default: false

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:profile, :name, :username, :email, :password, :password_confirmation, :role, :verify])
    |> validate_required([:name, :username, :email, :password, :password_confirmation, :role, :verify])
    |> unique_constraint(:username, message: "username_already_taken")
    |> unique_constraint(:email, message: "email_already_taken")
    |> update_change(:email, &String.downcase(&1))
    |> validate_format(:email, ~r/@/)
    |> validate_confirmation(:password)
    |> validate_length(:password, min: 8, max: 100)
    |> gen_hash_password()
  end

  defp gen_hash_password(
         %Ecto.Changeset{
           valid?: true,
           changes: %{
             password: password
           }
         } = changeset
       ) do
    change(changeset, Bcrypt.add_hash(password))
  end
end
