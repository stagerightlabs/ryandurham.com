<?php

use Livewire\Attributes\Title;
use Livewire\Component;

new #[Title('Links')] class extends Component
{
    //
};
?>

<div class="font-serif space-y-10">
    <section class="space-y-3">
        <flux:heading size="xl" level="2">Links</flux:heading>
        <flux:text class="text-lg">I am not one for social media, but there are a few places you can find me or my work online:</flux:text>
    </section>
    <section class="space-y-8">
          <article class="space-y-3">
              <flux:heading size="lg" level="3">GitHub</flux:heading>
              <flux:text size="lg">Many of my open source projects can be viewed on the Stage Right Labs <flux:link href="https://github.com/stagerightlabs/" target="_blank">GitHub account</flux:link>.</flux:text>
          </article>
          <article class="space-y-3">
              <flux:heading size="lg" level="3">Technical Writing</flux:heading>
              <flux:text size="lg">Occasionally I will write about software and deveopment topics on the Stage Right Labs <flux:link href="https://stagerightlabs.com" target="_blank">blog</flux:link>.</flux:text>
          </article>
          <article class="space-y-3">
              <flux:heading size="lg" level="3">LinkedIn</flux:heading>
              <flux:text size="lg">You can see my work history and other resume details on my <flux:link href="https://www.linkedin.com/in/rydurham/" target="_blank">LinkedIn profile</flux:link>.</flux:text>
          </article>
    </section>
</div>
