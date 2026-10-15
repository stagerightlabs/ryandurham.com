<?php

use Livewire\Attributes\Title;
use Livewire\Component;

new #[Title('Hello')] class extends Component
{
    // public $title = 'My Post';
};
?>

<div>
    <img src="{{ asset('img/avatar.jpg') }}" class="w-60 mx-auto rounded-full my-6" />
    <div class="space-y-4 text-lg font-serif">
        <flux:text class="text-lg">Hello!</flux:text>
        <flux:text class="text-lg">My name is Ryan Durham, I am a software engineer based out of the Pacific North West of the United States. I have been working in the software industry for over 15 years in various capacities, and before that I worked as a project manager in the arts. I have been fortunate enough to work on quite a few interesting projects for a number of different companies and clients.</flux:text>
        <flux:text class="text-lg">I started out with PHP and Laravel but over the years I come to enjoy and appreciate many other tools, such as Typescript, React and MongoDB, among others. I especially enjoy working with PostgreSQL. I am also a huge soccer fan; go Thorns!</flux:text>
        <flux:text class="text-lg">I pride myself on attention to detail and quality communication skills. I try very hard to inhabit my values with every project I work on.</flux:text>
        <flux:text class="text-lg">If you are looking for help with a software project feel free to reach out to me: ryan at stagerightlabs dot com.</flux:text>
        <flux:text class="text-lg">~Ryan</flux:text>
    </div>
</div>
