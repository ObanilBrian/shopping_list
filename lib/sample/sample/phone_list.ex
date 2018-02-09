
defmodule Sample.Schemas.PhoneList do
  use Ecto.Schema
  import Ecto.Changeset
  alias Sample.Schemas.PhoneList


  schema ":phone_lists" do
    field :description, :string
    field :name, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(%PhoneList{} = phone_list, attrs) do
    phone_list
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
