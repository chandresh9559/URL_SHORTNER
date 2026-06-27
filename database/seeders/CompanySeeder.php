<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class CompanySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::insert(
            'INSERT INTO companies(name, created_at, updated_at) values(?, ?, ?), (?, ?, ?), (?, ?, ?)',
            [
                'ABC Business', now(), now(),
                'DEF Business', now(), now(),
                'GHI Business', now(), now(),
            ]
        );
    }
}
