defmodule Library.CompletionsTest do
  use Library.DataCase

  alias Library.Books

  describe "book completions" do

    @book_attrs %{
      category: "some-category",
      slug: "some-slug",
      sortable_title: "some sortable_title",
      title: "some title",
    }

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@book_attrs)
        |> Books.force_create_book()

      book
    end

    test "can record book completion" do
      book = book_fixture()

      Books.create_book_completion(book, "2010-09-02 16:06:58-07")

      book = Repo.preload(book, :completions)
      assert length(book.completions) == 1
    end

    test "can remove book completion" do
      book = book_fixture()
      {:ok, completion} = Books.create_book_completion(book, "2010-09-02 16:06:58-07")

      Books.remove_book_completion(completion)

      book = Repo.preload(book, :completions)
      assert length(book.completions) == 0
    end



  end
end
