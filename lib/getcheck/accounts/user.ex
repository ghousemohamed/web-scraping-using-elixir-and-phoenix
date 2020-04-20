defmodule Getcheck.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :phone_number, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :phone_number])
    |> validate_required([:name, :email, :phone_number])
  end

  def without_validate(user, attrs) do
    IO.inspect("Removing the validations")
    newuser = user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name])
    IO.inspect(newuser)
  end

end
