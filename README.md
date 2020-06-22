# RyanDurham.com

The repository for my own personal home page, [ryandurham.com](https://www.ryandurham.com). This is primarily an experiment for me; an excuse to get my hands dirty with Elixir, Phoenix and Phoenix Live View.

## Local Development

You will need to have Erlang and Elixir installed on your local system.  [See the installation steps here.](https://elixir-lang.org/install.html)

Clone the repo and then fetch the dependencies with `mix deps.get`.

Install the node dependencies:

```
npm install --prefix=apps/rcd_web/assets
npm run watch --prefix=apps/rcd_web/assets
```

Set up your local config files:

```
cp config/prod.secret.example dev.secret.exs
cp config/test.secret.example test.secret.exs
```

Make sure you update those files with the credentials required for your local postgres instance.

Run the migrations to set up the database.

```
mix ecto.migrate
```

You can now insert seed data into the database via IEX:

```
iex -S mix

# Set up an administrator account
iex> Admin.Console.Accounts.insert_user("email@example.com", "password")

# Insert book data into the database
iex> Library.Seeds.run()
```

At this point you should now be able to launch the development server

```
mix phx.server
```

The site will be reachable at `localhost:4000`

## Credits
- Theme inspired by [Night Owl](https://github.com/sdras/night-owl-vscode-theme)
- [Dank Mono](https://dank.sh/)
- [Heroicons](http://heroicons.dev)
- Moose icon made by [monkik](https://www.flaticon.com/authors/monkik) from [www.flaticon.com](https://www.flaticon.com/)
