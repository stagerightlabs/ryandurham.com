defmodule Library.BookTest do
  use Library.DataCase

  alias Library

  describe "books" do
    alias Library.Book

    @valid_attrs %{category: "some category", isbn13: "some isbn13", purchase_link: "some purchase_link", rating: 42, slug: "some slug", sortable_title: "some sortable_title", thoughts: "some thoughts", title: "some title", year: 42}
    @update_attrs %{category: "some updated category", isbn13: "some updated isbn13", purchase_link: "some updated purchase_link", rating: 43, slug: "some updated slug", sortable_title: "some updated sortable_title", thoughts: "some updated thoughts", title: "some updated title", year: 43}
    @invalid_attrs %{category: nil, isbn13: nil, purchase_link: nil, rating: nil, slug: nil, sortable_title: nil, thoughts: nil, title: nil, year: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Library.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Library.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Library.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Library.create_book(@valid_attrs)
      assert book.category == "some category"
      assert book.isbn13 == "some isbn13"
      assert book.purchase_link == "some purchase_link"
      assert book.rating == 42
      assert book.slug == "some slug"
      assert book.sortable_title == "some sortable_title"
      assert book.thoughts == "some thoughts"
      assert book.title == "some title"
      assert book.year == 42
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, %Book{} = book} = Library.update_book(book, @update_attrs)
      assert book.category == "some updated category"
      assert book.isbn13 == "some updated isbn13"
      assert book.purchase_link == "some updated purchase_link"
      assert book.rating == 43
      assert book.slug == "some updated slug"
      assert book.sortable_title == "some updated sortable_title"
      assert book.thoughts == "some updated thoughts"
      assert book.title == "some updated title"
      assert book.year == 43
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_book(book, @invalid_attrs)
      assert book == Library.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Library.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Library.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Library.change_book(book)
    end
  end
end
