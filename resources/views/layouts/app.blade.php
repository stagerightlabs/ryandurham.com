@props(['title' => null])
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>{{ $title ? $title.' · ' : '' }}{{ config('app.name', 'Laravel') }}</title>

        <link rel="icon" href="/favicon.ico" sizes="32x32">
        <link rel="icon" href="/favicon.svg" type="image/svg+xml" id="favicon">
        <link rel="apple-touch-icon" href="/apple-touch-icon.png">

        @vite('resources/css/app.css')

        @fluxAppearance

        <script>
            // Keep the favicon in step with the site theme (Flux toggles the `dark` class on <html>).
            (() => {
                const sync = () => {
                    const icon = document.getElementById('favicon');
                    if (icon) icon.href = document.documentElement.classList.contains('dark')
                        ? '/favicon-dark.svg'
                        : '/favicon-light.svg';
                };
                sync();
                new MutationObserver(sync).observe(document.documentElement, {
                    attributes: true,
                    attributeFilter: ['class'],
                });
            })();
        </script>
    </head>

    <body class="flex min-h-screen bg-zinc-100 font-sans text-zinc-900 antialiased dark:bg-zinc-950 dark:text-zinc-100">
        <main class="mx-auto w-full max-w-4xl px-6 py-6 sm:py-12 md: py-24 lg:py-48">
            <div class="mx-4">
                <livewire:navigation class="pl-24" />
            </div>
            <flux:card variant="soft" size="lg" wire:transition.navigate>
                <flux:card.body>
                      {{ $slot }}
                </flux:card.body>
            </flux:card>
            <flux:text class="mx-4 mt-4 text-right text-sm">
                Ryan C. Durham
            </flux:text>
        </main>
        @fluxScripts
    </body>
</html>
