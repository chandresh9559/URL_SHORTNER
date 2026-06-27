<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class InviteCompanyTest extends TestCase
{
    use RefreshDatabase;

    public function test_super_admin_can_open_the_invite_page(): void
    {
        $user = User::factory()->create([
            'role' => 'SuperAdmin',
        ]);

        $response = $this->actingAs($user)->get('/invite-company');

        $response->assertStatus(200);
        $response->assertViewIs('superadmin_invite');
    }

    public function test_non_super_admin_is_redirected_to_the_dashboard_when_trying_to_open_the_invite_page(): void
    {
        $user = User::factory()->create([
            'role' => 'Admin',
        ]);

        $response = $this->actingAs($user)->get('/invite-company');

        $response->assertRedirect('/dashboard');
    }
}
