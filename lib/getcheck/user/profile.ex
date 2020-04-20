defmodule Getcheck.User.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_profiles" do
    field :dob, :string
    field :gender, :string

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    IO.inspect("Reaching here with the payload")
    profile
    |> cast(attrs, [:gender, :dob])
    |> validate_required([:gender, :dob])
  end
end
