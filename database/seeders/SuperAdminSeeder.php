<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Seeder;

class SuperAdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::insert(
            'INSERT INTO users (company_id, role, name, email, password, created_at, updated_at) values(?, ?, ?, ?, ?, ?, ?)',
          [
            null, 'superadmin', 'Super Admin', 'superadmin@yopmail.com', Hash::make('password'), now(), now(), 
          ]
        );
    }
}
