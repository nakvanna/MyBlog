defmodule BlogBackend.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :profile,
          :string,
          default: "https://i.ibb.co/XV3D9Y2/Profile-Placeholder-image-Gray-silhouette-no-photo-of-a-person-on-the-avatar-The-default-pic-is-used.jpg"
      add :name, :string
      add :username, :string
      add :email, :string
      add :password_hash, :string
      add :role, :string
      add :verify, :boolean, default: false, null: false

      timestamps()
    end
    create unique_index(:users, [:email])
    create unique_index(:users, [:username])
  end
end
