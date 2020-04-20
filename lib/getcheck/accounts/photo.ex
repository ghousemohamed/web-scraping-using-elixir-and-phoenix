defmodule Getcheck.Accounts.Photo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "photos" do
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(photo, attrs) do
    IO.inspect("Hitting this route with the payload")
    IO.inspect(photo)
    photo
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
