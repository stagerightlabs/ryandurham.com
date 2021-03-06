defmodule Authors.AuthorsTest do
  use Library.DataCase

  alias Library.Authors
  alias Library.Authors.Author

  describe "authors" do

    @valid_attrs %{
      name: "some name",
      url: "some url",
      sortable_name: "name, some",
      slug: "some-name"
    }
    @update_attrs %{
      name: "some updated name",
      slug: "some updated slug",
      sortable_name: "some updated sortable_name",
      url: "some updated url"
    }
    @invalid_attrs %{name: nil, slug: nil, sortable_name: nil, url: nil}

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Authors.force_create_author()

      author
    end

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Authors.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Authors.get_author!(author.id) == author
    end

    test "get_author_by_slug!/1 returns the author with given slug" do
      author = author_fixture()
      assert Authors.get_author_by_slug!(author.slug) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert {:ok, %Author{} = author} =
               Authors.create_author(%{name: "Some Name", url: "some url"})

      assert author.name == "Some Name"
      assert author.slug == "some-name"
      assert author.sortable_name == "name, some"
      assert author.url == "some url"
    end

    test "create_author/1 with valid data creates a author with an incremental slug" do
      author_fixture()
      assert {:ok, %Author{} = author} = Authors.create_author(@valid_attrs)
      assert author.name == "some name"
      assert author.slug == "some-name-1"
      assert author.sortable_name == "name, some"
      assert author.url == "some url"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Authors.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, %Author{} = author} = Authors.update_author(author, @update_attrs)
      assert author.name == "some updated name"
      assert author.slug == "some updated slug"
      assert author.sortable_name == "some updated sortable_name"
      assert author.url == "some updated url"
    end

    test "update_author/2 with existing slug returns error changeset" do
      author_fixture(%{name: "some other author", slug: "existing-slug"})

      author = author_fixture(%{slug: "author"})
      assert {:error, %Ecto.Changeset{}} = Authors.update_author(author, %{slug: "existing-slug"})
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Authors.update_author(author, @invalid_attrs)
      assert author == Authors.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Authors.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Authors.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Authors.change_author(author)
    end
  end
end
