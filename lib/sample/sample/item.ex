defmodule Sample.Schemas.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias Sample.Schemas.Item


  schema "items" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
