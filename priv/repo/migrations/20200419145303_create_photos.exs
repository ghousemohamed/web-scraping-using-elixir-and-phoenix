defmodule Getcheck.Repo.Migrations.CreatePhotos do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :url, :string

      timestamps()
    end

  end
end
