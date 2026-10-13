<?php

use Livewire\Component;

new class extends Component
{
    //
};
?>

<div class="font-serif space-y-10">
    <section class="space-y-3">
        <div class="flex items-center justify-between">
            <flux:heading size="xl" level="2">Resume</flux:heading>
            <flux:button href="{{ asset(rawurlencode('Ryan Durham Resume.pdf')) }}" download="Ryan Durham Resume.pdf" icon="arrow-down-tray" size="sm">Download PDF</flux:button>
        </div>
        <flux:text class="text-lg">
            Full stack engineer with 10+ years experience in building and maintaining enterprise web applications. Draws on a background in project management with a focus on communication. Enjoys staying current with industry trends and learning about new technologies.
        </flux:text>
    </section>

    <section class="space-y-8">
        <flux:heading size="xl" level="2">Experience</flux:heading>

        <article class="space-y-3">
            <flux:heading size="lg" level="3">Firebrand Technologies</flux:heading>
            <flux:text class="text-lg italic">
                Senior Software Engineer: 2021 &ndash; 2026
            </flux:text>
            <ul class="list-disc space-y-1 pl-6 text-lg text-zinc-500 dark:text-white/70">
                <li>Lead engineer supporting the <i>Eloquence On Alert</i> product offering.</li>
                <li>Created a high volume intake queue for processing ONIX metadata files, increasing throughput 10x</li>
                <li>Rebuilt AWS infrastructure to facilitate stack modernization while also reducing hosting costs by ~20%. </li>
                <li>Lead a team that migrated the product from Symfony v6 to Laravel v13 along with a complete design overhaul and no loss of customer data.</li>
                <li>Responsible for interfacing with customers to field feature requests and help with user training.</li>
                <li>Designed a proprietary ONIX compatible JSON schema for enabling the efficient storage and retrieval of book metadata at scale.</li>
                <li>Developed an ETL pipeline in Node that manages conversion between ONIX XML and the proprietary JSON format, improving record processing times 2x.</li>
            </ul>
        </article>

        <article class="space-y-3">
            <flux:heading size="lg" level="3">Phylos Bioscience</flux:heading>
            <flux:text class="text-lg italic">
                Senior Engineer: 2019 &ndash; 2021<br>
                Software Engineer: 2016 &ndash; 2019<br>
                Contractor: 2014 &ndash; 2016
            </flux:text>
            <ul class="list-disc space-y-1 pl-6 text-lg text-zinc-500 dark:text-white/70">
                <li>Designed, built and managed an enterprise scale PHP application that handles sales, LIMS laboratory workflows, delivery of customer results and financial reporting. Over 400,000+ customer samples processed to date.</li>
                <li>Served as a liaison between engineering, the laboratory and QA, helping guide development road maps to consistently achieve quarterly objectives.</li>
                <li>Implemented full-text search for a public facing strain database using PostgreSQL.</li>
                <li>Built an API for genotype data reporting in Elixir.</li>
                <li>Manages AWS infrastructure for deployments and hosting.</li>
                <li>Oversaw a production database conversion from MySQL to PostgreSQL.</li>
            </ul>
        </article>

        <article class="space-y-3">
            <flux:heading size="lg" level="3">Stage Right Labs, LLC</flux:heading>
            <flux:text class="text-lg italic">Owner / Founder: 2014 &ndash; Present</flux:text>
            <ul class="list-disc space-y-1 pl-6 text-lg text-zinc-500 dark:text-white/70">
                <li>Provides consulting services for clients who lack technical backgrounds.</li>
                <li>Advises non-profits, artists and startups on best practices for the operation and maintenance of websites, domain names and email accounts. Assists with recovering and maintaining corrupted WordPress installations.</li>
            </ul>
        </article>
    </section>

    <section class="space-y-3">
        <flux:heading size="xl" level="2">Skills</flux:heading>
        <ul class="list-disc space-y-1 pl-6 text-lg text-zinc-500 dark:text-white/70">
            <li>PHP, Laravel, Symfony, WordPress</li>
            <li>Javascript / Typescript, Vue.js, React, Tailwind, Zod</li>
            <li>PostgreSQL, MySQL, MongoDB, SQLite</li>
            <li>Docker, EC2, ECS, S3, other AWS tools</li>
            <li>Agentic Development Workflows</li>
        </ul>
    </section>

    <section class="space-y-3">
        <flux:heading size="xl" level="2">Education</flux:heading>
        <ul class="list-disc space-y-1 pl-6 text-lg text-zinc-500 dark:text-white/70">
            <li>Master of Fine Arts (MFA) in Stage Management; Yale School of Drama (2007)</li>
            <li>Bachelor of Arts (BA) in Drama / Minor in Computer Science; Vassar College (2004)</li>
        </ul>
    </section>
</div>
