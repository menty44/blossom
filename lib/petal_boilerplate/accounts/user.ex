defmodule PetalBoilerplate.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :age, :integer
    field :avatar, :string
    field :blacklisted, :boolean, default: false
    field :country, :string
    field :dob, :date
    field :firstname, :string
    field :gender, :string
    field :lastname, :string
    field :privacy, :boolean, default: false
    field :status, :boolean, default: false
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:firstname, :lastname, :age, :country, :gender, :avatar, :username, :dob, :status, :blacklisted, :privacy])
    |> validate_required([:firstname, :lastname, :age, :country, :gender, :avatar, :username, :dob, :status, :blacklisted, :privacy])
  end
end
