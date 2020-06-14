defmodule RcdWeb.BookView do
  use RcdWeb, :view

  def formatted_completion_date(date) do
    DateTime.shift_zone!(date, "America/Los_Angeles", Calendar.get_time_zone_database())
    |> Timex.format!("{Mfull} {D}, {YYYY}")
  end

  def csrf_token() do
    Phoenix.Controller.get_csrf_token()
  end

  def today() do
    {:ok, today} =
      Timex.today()
      |> Timex.format("{YYYY}-{0M}-{0D}")

    today
  end
end
