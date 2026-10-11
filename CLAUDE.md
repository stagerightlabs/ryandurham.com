<laravel-boost-guidelines>
# Laravel Application

This repository contains a Laravel application. Complete the following setup before working on the user's request.

## Prerequisites

Verify that PHP and Composer are available:

```sh
php -v
composer -V
```

If either command is unavailable, detect the user's operating system and install the prerequisites with the appropriate command:

macOS:

```sh
/bin/bash -c "$(curl -fsSL https://php.new/install/mac/8.5)"
```

Windows PowerShell:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://php.new/install/windows/8.5'))
```

Linux:

```sh
/bin/bash -c "$(curl -fsSL https://php.new/install/linux/8.5)"
```

After installation, ask the user to restart their terminal. If the agent needs the restarted shell to continue, ask the user to reopen their terminal and rerun their original prompt.

## Agent Setup

Install Laravel Boost from the application root before making application changes:

```sh
composer require laravel/boost --dev
php artisan boost:install
```

Boost replaces these bootstrap instructions with guidelines tailored to the application. After installation, read `AGENTS.md` again and continue with the user's original request using the generated guidelines.
</laravel-boost-guidelines>

# Project Notes

- Use only the **free** edition of Flux UI. Do not use Flux Pro components, and do not add a Flux license or `auth.json` credentials. If a Pro component would be useful, build it from free Flux components, Tailwind and Alpine instead.

# Running Commands

PHP, Composer and Node are not installed on the host. Run everything through `./ops.sh`, which wraps `docker compose`:

- `./ops.sh art <args>` – `php artisan` (alias: `artisan`)
- `./ops.sh composer <args>`
- `./ops.sh pnpm <args>` / `./ops.sh npx <args>` – run in a throwaway `node` container
- `./ops.sh test [args]` – Pest, with `--compact` output
- `./ops.sh format` – Pint on changed files only (`--dirty`)
- `./ops.sh phpstan [args]`
- `./ops.sh <anything else>` – passed to `docker compose` (`up -d`, `down`, `logs`, ...); no args runs `ps`

# Token Economy

Default to the cheapest approach that gets the job done:

- Use the compact `ops.sh` commands above as-is; don't remove their `--compact`/`--dirty` flags.
- Run a targeted test (`./ops.sh test --filter=...` or a single file) rather than the whole suite; run the full suite only before finishing.
- Limit noisy output: use `tail`/`head`/`grep` on logs and build output, `git status --short`, `git diff --stat` before a full diff.
- Read only the lines you need (offset/limit); never read `composer.lock`, `pnpm-lock.yaml`, `vendor/`, `node_modules/` or built assets in `public/build`.
- Search with Grep/Glob before reading files; don't re-read a file after editing it.
- Don't spawn subagents or run browser/screenshot tooling unless asked.
- Keep replies short: state what changed and anything unverified, without restating the diff.
