defmodule Sample.Repo.Migrations.CreatePhoneList do
  use Ecto.Migration

  def change do
    create table(:phone_lists) do
      add :name, :string
      add :description, :string
      add :url, :string

      timestamps()
    end
  end
end
