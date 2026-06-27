<?php

namespace Tests\Feature;

use App\Models\Company;
use App\Models\ShortUrl;
use App\Models\User;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class DashboardPaginationTest extends TestCase
{
    use RefreshDatabase;

    public function test_dashboard_lists_are_paginated_for_admin_users(): void
    {
        $company = Company::create([
            'name' => 'Acme Corp',
        ]);

        $admin = User::factory()->create([
            'company_id' => $company->id,
            'role' => 'admin',
        ]);

        User::factory()->count(12)->create([
            'company_id' => $company->id,
            'role' => 'member',
        ]);

        for ($i = 0; $i < 15; $i++) {
            ShortUrl::create([
                'company_id' => $company->id,
                'user_id' => $admin->id,
                'original_url' => 'https://example.com/' . $i,
                'short_code' => 'abc' . $i,
            ]);
        }

        $response = $this->actingAs($admin)->get('/dashboard');

        $response->assertOk();
        $response->assertViewHas('users', function ($users) {
            return $users instanceof LengthAwarePaginator && $users->count() === 10;
        });
        $response->assertViewHas('shortUrls', function ($shortUrls) {
            return $shortUrls instanceof LengthAwarePaginator && $shortUrls->count() === 10;
        });
    }

    public function test_dashboard_can_filter_short_urls_by_today(): void
    {
        $company = Company::create([
            'name' => 'Acme Corp',
        ]);

        $admin = User::factory()->create([
            'company_id' => $company->id,
            'role' => 'admin',
        ]);

        $todayUrl = new ShortUrl([
            'company_id' => $company->id,
            'user_id' => $admin->id,
            'original_url' => 'https://example.com/today',
            'short_code' => 'today-code',
        ]);
        $todayUrl->created_at = now();
        $todayUrl->updated_at = now();
        $todayUrl->save();

        $oldUrl = new ShortUrl([
            'company_id' => $company->id,
            'user_id' => $admin->id,
            'original_url' => 'https://example.com/old',
            'short_code' => 'old-code',
        ]);
        $oldUrl->created_at = now()->subDays(7);
        $oldUrl->updated_at = now()->subDays(7);
        $oldUrl->save();

        $response = $this->actingAs($admin)->get('/dashboard?sort_by_date=today');

        $response->assertOk();
        $response->assertSee('today-code');
        $response->assertDontSee('old-code');
    }
}
