defmodule Getcheck.Repo.Migrations.CreateAccountProfiles do
  use Ecto.Migration

  def change do
    create table(:account_profiles) do
      add :gender, :string

      timestamps()
    end

  end
end
