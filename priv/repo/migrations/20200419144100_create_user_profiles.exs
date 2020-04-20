defmodule Getcheck.Repo.Migrations.CreateUserProfiles do
  use Ecto.Migration

  def change do
    create table(:user_profiles) do
      add :gender, :string
      add :dob, :string

      timestamps()
    end

  end
end
