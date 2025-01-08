<?php

namespace Tests\Unit;

use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;
use App\Models\User;

class LoginTest extends TestCase
{
    use RefreshDatabase;

    /**
     * Test the login functionality.
     *
     * @return void
     */
    public function test_user_can_login()
    {
        // Create a user
        $user = User::factory()->create([
            'email' => 'test@example.com',
            'password' => bcrypt('password123'),
        ]);

        // Attempt to login
        $response = $this->post('/login', [
            'email' => 'test@example.com',
            'password' => 'password123',
        ]);

        // Assert user is redirected to the intended page
        $response->assertRedirect('/home');

        // Assert the user is authenticated
        $this->assertAuthenticatedAs($user);
    }

    /**
     * Test login with invalid credentials.
     *
     * @return void
     */
    public function test_user_cannot_login_with_invalid_credentials()
    {
        // Attempt to login with invalid credentials
        $response = $this->post('/login', [
            'email' => 'wrong@example.com',
            'password' => 'wrongpassword',
        ]);

        // Assert the user is redirected back to the login page
        $response->assertRedirect('/login');

        // Assert the user is not authenticated
        $this->assertGuest();
    }

    /**
     * Test the logout functionality.
     *
     * @return void
     */
    public function test_user_can_logout()
    {
        // Create and authenticate a user
        $user = User::factory()->create();
        $this->be($user);

        // Attempt to logout
        $response = $this->post('/logout');

        // Assert user is redirected to the home page or login page
        $response->assertRedirect('/');

        // Assert the user is no longer authenticated
        $this->assertGuest();
    }
}
