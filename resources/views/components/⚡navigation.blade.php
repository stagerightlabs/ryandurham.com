<?php

use Livewire\Component;

new class extends Component
{
    //
};
?>

<flux:navbar>
    <flux:navbar.item href="{{ route('welcome') }}" wire:navigate>Hello</flux:navbar.item>
    <flux:navbar.item href="{{ route('resume') }}" wire:navigate>Resume</flux:navbar.item>
    <flux:navbar.item href="{{ route('values') }}" wire:navigate>Values</flux:navbar.item>
    <flux:navbar.item href="{{ route('links') }}" wire:navigate>Links</flux:navbar.item>
</flux:navbar>
