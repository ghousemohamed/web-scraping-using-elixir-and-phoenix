defmodule Getcheck.Accounts.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "account_profiles" do
    field :gender, :string

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    IO.inspect("Reaching here with the payload")
    profile
    |> cast(attrs, [:gender])
    |> validate_required([:gender])
  end

end
