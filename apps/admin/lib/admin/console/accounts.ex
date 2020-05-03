defmodule Admin.Console.Accounts do
  alias Admin.Repo
  alias Admin.Accounts.User
  alias Calendar.Strftime

  @doc """
  Show a list of the users in the database
  """
  @spec list_users :: [any]
  def list_users do
    Repo.all(Admin.Accounts.User)
    |> Enum.map(fn user ->
      IO.puts(
        to_string(user.id) <>
          ": " <>
          user.email <>
          " - " <>
          confirmation_timestamp(user)
      )
    end)
  end

  @doc """
  Create a new user from an email address and a password.
  """
  @spec insert_user(String.t(), String.t()) :: :ok
  def insert_user(email, password) do
    case Admin.Accounts.register_user(%{email: email, password: password}) do
      {:ok, user} ->
        IO.puts("Created new user: " <> user.email)

      {:error, changeset} ->
        IO.puts("Invalid Request")

        get_list_of_errors_from_change_set(changeset)
        |> IO.puts()

      _ ->
        IO.puts("Error: there was a problem adding that user.")
    end
  end

  def confirm_user(email) do
    case Admin.Accounts.get_user_by_email(email) do
      user = %{id: _id, confirmed_at: nil} ->
        {:ok, user} = Repo.update(User.confirm_changeset(user))
        IO.puts("user " <> user.email <> " has been confirmed.")

      %{email: email, confirmed_at: _confirmed_at} ->
        IO.puts("user " <> email <> " has already been confirmed")

      _ ->
        IO.puts("Invalid user")
    end
  end

  defp confirmation_timestamp(%{confirmed_at: confirmed_at}) do
    case Strftime.strftime(confirmed_at, "%Y-%m-%d") do
      {:ok, formatted} ->
        formatted

      _ ->
        "nil"
    end
  end

  defp get_list_of_errors_from_change_set(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
    |> Enum.map(fn {key, errors} ->
      "#{key} #{Enum.join(errors, ", ")}"
    end)
  end
end
