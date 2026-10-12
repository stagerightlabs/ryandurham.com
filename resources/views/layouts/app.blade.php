@props(['title' => null])
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>{{ $title ? $title.' · ' : '' }}{{ config('app.name', 'Laravel') }}</title>

        @vite('resources/css/app.css')

        @fluxAppearance
    </head>

    <body class="flex min-h-screen bg-zinc-100 font-sans text-zinc-900 antialiased dark:bg-zinc-950 dark:text-zinc-100">
        {{-- mx-auto centers the box horizontally; it sits near the top and the page scrolls when content is long. --}}



        <main class="mx-auto w-full max-w-4xl px-6 py-48">



            <div class="mx-4"><livewire:navigation class="pl-24" /></div>
            <flux:card variant="soft" size="lg" wire:transition.navigate>
                <flux:card.body class="space-y-6" >
                      {{ $slot }}
                </flux:card.body>

            </flux:card>
        </main>
        @fluxScripts
    </body>
</html>
