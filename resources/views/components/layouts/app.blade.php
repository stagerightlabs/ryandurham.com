@props(['title' => null])

<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="color-scheme" content="light dark">

        <title>{{ $title ? $title.' · ' : '' }}{{ config('app.name', 'Laravel') }}</title>

        @vite(['resources/css/app.css', 'resources/js/app.js'])
    </head>
    <body class="flex min-h-screen bg-zinc-100 font-sans text-zinc-900 antialiased dark:bg-zinc-950 dark:text-zinc-100">
        {{-- mx-auto centers the box horizontally; it sits near the top and the page scrolls when content is long. --}}
        <main class="mx-auto w-full max-w-4xl px-6 py-48">
            <div class="rounded-xl border border-zinc-200 bg-white p-8 shadow-sm dark:border-zinc-800 dark:bg-zinc-900">
                <nav class="mb-6 flex gap-4 text-sm text-zinc-500 dark:text-zinc-400">
                    <a href="{{ route('welcome') }}" class="hover:text-zinc-900 dark:hover:text-zinc-100 {{ request()->routeIs('welcome') ? 'font-semibold text-zinc-900 dark:text-zinc-100' : '' }}">Home</a>
                    <a href="{{ route('about') }}" class="hover:text-zinc-900 dark:hover:text-zinc-100 {{ request()->routeIs('about') ? 'font-semibold text-zinc-900 dark:text-zinc-100' : '' }}">About</a>
                    <a href="{{ route('lorem') }}" class="hover:text-zinc-900 dark:hover:text-zinc-100 {{ request()->routeIs('lorem') ? 'font-semibold text-zinc-900 dark:text-zinc-100' : '' }}">Lorem</a>
                </nav>

                {{ $slot }}
            </div>
        </main>
    </body>
</html>
