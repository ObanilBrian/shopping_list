defmodule SampleWeb.PageController do
  use SampleWeb, :controller
  import Ecto.{Query, Changeset}, warn: false

  alias Sample.Repo
  alias Sample.Schemas.Item
  alias Sample.Schemas.PhoneList

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

  def add_phone(conn, _params) do
    changeset = PhoneList.changeset(%PhoneList{}, %{})
    phone_lists =
      PhoneList
      |> Repo.all
    render conn, "add_phone.html", changeset: changeset, phone_lists: phone_lists
  end

  def create_phone(conn, %{"phone_list" => phone_list}) do
    case insert_phone_lists(phone_list) do
      {:ok, phone_list} ->
        conn
        |> put_flash(:info, "Succeess!")
        |> redirect(to: "/samsung")
      {:error, changeset} ->
        phone_lists=
          PhoneList
          |> Repo.all

          conn
          |> put_flash(:error, "Please Check Your Inputs")
          |> render("add_phone.html", changeset: changeset, phone_lists: phone_lists)
    end
  end
  def samsung(conn, _) do
    changeset = PhoneList.changeset(%PhoneList{}, %{})
    phone_lists =
      PhoneList
      |> Repo.all
    render conn, "samsung.html", phone_lists: phone_lists, changeset: changeset
  end

  def edit_phone(conn, %{"id" => id}) do
      phone_list =
        PhoneList
        |>where([pl], pl.id == ^id)
        |>Repo.one
    changeset = PhoneList.changeset(phone_list, %{})
     render conn, "edit_phone.html", changeset: changeset, phone_list: phone_list
  end

  def update_phone(conn, %{"id" => id, "phone_list" => phone_list}) do
    case update_phone_lists(id, phone_list) do
      {:ok, phone_list} ->
        conn
        |>put_flash(:info, "Success!")
        |>redirect(to: "/samsung")
      {:error, changeset} ->
        phone_lists =
          PhoneList
          Repo.all

          conn
          |> put_flash(:error, "Please Check Your Inputs")
          |> render("/samsung.html", changeset: changeset, phonelists: phone_lists)
    end
  end

  def delete_phone(conn, %{"id" => id}) do
    case delete_phone_lists(id) do
      {:ok, phone_list} ->
        json conn, Poison.encode!(%{valid: true})
      {:error, changeset} ->
        json conn, Poison.encode!(%{valid: false})
    end
  end

  def insert_item(item) do
    %Item{}
    |> Item.changeset(item)
    |> Repo.insert
  end

  def insert_phone_lists(phone_list) do
    %PhoneList{}
    |> PhoneList.changeset(phone_list)
    |> Repo.insert
  end

  def update_phone_lists(id, phone_list) do
    phone_list_record =
      PhoneList
      |>where([pl], pl.id == ^id)
      |>Repo.one
    phone_list_record
    |>PhoneList.changeset(phone_list)
    |>Repo.update
  end

  def delete_phone_lists(id) do
    phone_list_record =
      PhoneList
      |>where([pl], pl.id == ^id)
      |>Repo.one
    phone_list_record
    |>Repo.delete
  end

end
