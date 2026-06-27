<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::insert(
            'INSERT INTO users(company_id, role, name, email, password, created_at, updated_at) values(?, ?, ?, ?, ?, ?, ?), (?, ?, ?, ?, ?, ?, ?), (?, ?, ?, ?, ?, ?, ?), (?, ?, ?, ?, ?, ?, ?), (?, ?, ?, ?, ?, ?, ?), (?, ?, ?, ?, ?, ?, ?), (?, ?, ?, ?, ?, ?, ?), (?, ?, ?, ?, ?, ?, ?),(?, ?, ?, ?, ?, ?, ?), (?, ?, ?, ?, ?, ?, ?), (?, ?, ?, ?, ?, ?, ?), (?, ?, ?, ?, ?, ?, ?)',
            [
                1, 'admin', 'Deepu', 'deepu@yopmail.com', Hash::make('password'), now(), now(),
                1, 'member', 'Rahul', 'rahul@yopmail.com', Hash::make('password'), now(), now(),
                1, 'sales', 'Ankush', 'ankush@yopmail.com', Hash::make('password'), now(), now(),
                1, 'manager', 'Deepak', 'deepak@yopmail.com', Hash::make('password'), now(), now(),
                2, 'admin', 'Deepankar', 'deepankar@yopmail.com', Hash::make('password'), now(), now(),
                2, 'member', 'Anil', 'anil@yopmail.com', Hash::make('password'), now(), now(),
                2, 'sales', 'Aman', 'aman@yopmail.com', Hash::make('password'), now(), now(),
                2, 'manager', 'Raman', 'raman@yopmail.com', Hash::make('password'), now(), now(),
                3, 'admin', 'Prince', 'price@yopmail.com', Hash::make('password'), now(), now(),
                3, 'member', 'Anubhav', 'anubhav@yopmail.com', Hash::make('password'), now(), now(),
                3, 'sales', 'Ananya', 'ananya@yopmail.com', Hash::make('password'), now(), now(),
                3, 'admin', 'Aradhya', 'aradhya@yopmail.com', Hash::make('password'), now(), now(),
            ]
        );
    }
}
