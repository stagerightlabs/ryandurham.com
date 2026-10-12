<?php

use Illuminate\Support\Facades\Route;

Route::livewire("/", "pages::welcome")->name("welcome");
Route::livewire("/resume", "pages::resume")->name("resume");
Route::livewire("/values", "pages::values")->name("values");
Route::livewire("/links", "pages::links")->name("links");
