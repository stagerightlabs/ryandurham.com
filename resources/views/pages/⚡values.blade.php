<?php

use Livewire\Attributes\Title;
use Livewire\Component;

new #[Title('Values')] class extends Component
{
    //
};
?>

<div class="font-serif space-y-10">
    <section class="space-y-3">
        <flux:heading size="xl" level="2">Personal Values</flux:heading>
        <flux:text class="text-lg">There are a handful of principles that I use to guide my decisions and actions every day; they are important enough to me that I am sharing them here:</flux:text>
    </section>
    <section class="space-y-8">
          <article class="space-y-3">
              <flux:heading size="lg" level="3">Honesty and Integrity</flux:heading>
              <flux:text size="lg">Sincerity and truthfulness is important; I try always to be clear and honest in my communication and I hold myself to a high standard of behavior. Always do the right thing, no matter the consequences.</flux:text>
          </article>
    </section>
    <section class="space-y-8">
          <article class="space-y-3">
              <flux:heading size="lg" level="3">Responsibility</flux:heading>
              <flux:text size="lg">I take ownership of my actions; laying blame elsewhere does no good. When entrusted with responsibilities I take them very seriously and always follow through to the best of my ability.</flux:text>
          </article>
    </section>
    <section class="space-y-8">
          <article class="space-y-3">
              <flux:heading size="lg" level="3">Sustainability</flux:heading>
              <flux:text size="lg">We only have one earth; let's take care of it and make it better for future generations.</flux:text>
          </article>
    </section>
    <section class="space-y-8">
          <article class="space-y-3">
              <flux:heading size="lg" level="3">Kindness and Compassion</flux:heading>
              <flux:text size="lg">We should take more time to understand other people and see what it is like to live in their shoes. Diverse experiences and viewpoints are valuable and should be held in high regard. There is no reason not to treat other people and communities with decency and respect.</flux:text>
          </article>
    </section>
    <section class="space-y-8">
          <article class="space-y-3">
              <flux:heading size="lg" level="3">Discipline and Temperance</flux:heading>
              <flux:text size="lg">I find that moderation is good in all things; I aim for self-restraint and balance wherever possible.</flux:text>
          </article>
    </section>
    <section class="space-y-8">
          <article class="space-y-3">
              <flux:text size="lg"></flux:text>
          </article>
    </section>
</div>
