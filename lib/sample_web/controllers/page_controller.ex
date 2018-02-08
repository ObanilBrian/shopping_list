defmodule SampleWeb.PageController do
  use SampleWeb, :controller
  import Ecto.{Query, Changeset}, warn: false

  alias Sample.Repo
  alias Sample.Schemas.Item

  def index(conn, _params) do
    changeset = Item.changeset(%Item{}, %{})
    items =
      Item
      |> Repo.all
    render conn, "index.html", changeset: changeset, items: items
  end

  def create(conn, %{"item" => item}) do
    case insert_item(item) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Success!")
        |> redirect(to: "/")
      {:error, changeset} ->
        items =
          Item
          |> Repo.all

        conn
        |> put_flash(:error, "Please check your inputs.")
        |> render("index.html", changeset: changeset, items: items)
    end
  end

  def insert_item(item) do
    %Item{}
    |> Item.changeset(item)
    |> Repo.insert
  end
end
