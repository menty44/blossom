defmodule PetalBoilerplate.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :firstname, :string
      add :lastname, :string
      add :age, :integer
      add :country, :string
      add :gender, :string
      add :avatar, :text
      add :username, :string
      add :dob, :date
      add :status, :boolean, default: false, null: false
      add :blacklisted, :boolean, default: false, null: false
      add :privacy, :boolean, default: false, null: false

      timestamps()
    end
  end
end
