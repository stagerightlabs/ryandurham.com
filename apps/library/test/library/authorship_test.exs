defmodule Library.AuthorShipTest do
  use Library.DataCase

  alias Library.Books
  alias Library.Authors
  alias Library.Books.Book

  describe "associate authors with books" do
    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(%{
          name: "some name"
        })
        |> Authors.create_author()

      author
    end

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(%{
          title: "some title"
        })
        |> Books.create_book()

      book
    end

    test "an author can be associated with a book" do
      book = book_fixture()
      author = author_fixture()

      assert {:ok, %Book{} = book} = Books.add_author_to_book(book, author)
    end

    test "multiple authors can be associated with a book" do
      book = book_fixture()
      first_author = author_fixture(%{name: "Neal Stephenson"})
      second_author = author_fixture(%{name: "Cooper Moo"})

      Books.add_author_to_book(book, first_author)
      Books.add_author_to_book(book, second_author)

      book = Repo.preload(book, :authors)
      assert length(book.authors) == 2
    end

    test "an author can be removed from a book" do
      book = book_fixture()
      first_author = author_fixture(%{name: "Neal Stephenson"})
      second_author = author_fixture(%{name: "Cooper Moo"})

      Books.add_author_to_book(book, first_author)
      Books.add_author_to_book(book, second_author)

      Books.remove_author_from_book(book, second_author)

      book = Repo.preload(book, :authors)
      assert length(book.authors) == 1
    end

    test "a books author list can be replaced" do
      book = book_fixture()
      first_author = author_fixture(%{name: "Neal Stephenson"})
      second_author = author_fixture(%{name: "Cooper Moo"})

      Books.add_author_to_book(book, first_author)

      Books.replace_book_authors(book, second_author)

      book = Repo.preload(book, :authors)
      assert book.authors |> List.first() == second_author
    end
  end
end
