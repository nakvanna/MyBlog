defmodule BlogBackend.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias BlogBackend.Repo

  alias BlogBackend.Accounts.User

  alias BlogBackend.Helpers.QueryUtil

  def data() do
    Dataloader.Ecto.new(BlogBackend.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end
  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users(args) do
    QueryUtil.apply_pagination(User, args)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user(id), do: Repo.get(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end


  def login_user(args) do
    user = User
           |> where(username: ^String.downcase(args.email_or_username))
           |> or_where(email: ^String.downcase(args.email_or_username))
           |> Repo.one
    case check_password(user, args.password) do
      true -> {:ok, user}
      _ -> {:error, %{message: "Incorrect authentication!"}}

    end

  end

  defp check_password(user, password) do
    case user do
      nil -> false
      _ -> Bcrypt.verify_pass(password, user.password_hash)
    end
  end
end
