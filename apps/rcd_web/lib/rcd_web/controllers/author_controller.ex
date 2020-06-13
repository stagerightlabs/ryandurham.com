defmodule RcdWeb.AuthorController do
  use RcdWeb, :controller

  alias Library
  alias Library.Authors
  alias Library.Authors.Author

  plug :put_layout, {RcdWeb.LayoutView, "library.html"}

  def index(conn, _params) do
    authors =
      Authors.list_authors()
      |> Enum.group_by(fn author -> String.first(author.sortable_name) end)
      |> Enum.map(fn {letter, group} ->
        %{
          letter: String.upcase(letter),
          group: group,
          final: List.last(group)
        }
      end)

    render(conn, "index.html", authors: authors)
  end

  def new(conn, _params) do
    changeset = Authors.change_author(%Author{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"author" => author_params}) do
    case Authors.create_author(author_params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "#{author.name} created successfully.")
        |> redirect(to: Routes.author_path(conn, :show, author.slug))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"slug" => slug}) do
    author = Authors.get_author_by_slug!(slug)
    render(conn, "show.html", author: author)
  end

  def edit(conn, %{"slug" => slug}) do
    author = Authors.get_author_by_slug!(slug)
    changeset = Authors.change_author(author)
    render(conn, "edit.html", author: author, changeset: changeset)
  end

  def update(conn, %{"slug" => slug, "author" => author_params}) do
    author = Authors.get_author_by_slug!(slug)

    case Authors.update_author(author, author_params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "#{author.name} updated successfully.")
        |> redirect(to: Routes.author_path(conn, :show, author.slug))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", author: author, changeset: changeset)
    end
  end

  def delete(conn, %{"slug" => slug}) do
    author = Authors.get_author_by_slug!(slug)
    {:ok, _author} = Authors.delete_author(author)

    conn
    |> put_flash(:info, "#{author.name} removed successfully.")
    |> redirect(to: Routes.author_path(conn, :index))
  end
end
