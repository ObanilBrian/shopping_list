
defmodule Sample.Schemas.PhoneList do
  use Ecto.Schema
  import Ecto.Changeset
  alias Sample.Schemas.PhoneList


  schema ":phone_lists" do
    field :description, :string
    field :name, :string
    field :url, :sring

    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
