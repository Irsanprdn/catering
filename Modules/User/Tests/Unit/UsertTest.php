<?php

namespace Modules\User\Tests\Unit;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Gate;
use Modules\User\Http\Controllers\UsersController;

class UsertTest extends TestCase
{
    /**
     * A basic unit test example.
     *
     * @return void
     */
    public function test_create_method_denies_access_when_user_lacks_permission()
    {
        Gate::shouldReceive('denies')
            ->with('access_user_management')
            ->andReturn(true);

        $response = $this->get(route('users.create'));

        $response->assertStatus(403);
    }

    public function test_create_method_returns_view_when_user_has_permission()
    {
        Gate::shouldReceive('denies')
            ->with('access_user_management')
            ->andReturn(false);

        $response = $this->get(route('users.create'));

        $response->assertStatus(200);
        $response->assertViewIs('user::users.create');
    }
    public function test_index_denies_access_if_user_does_not_have_permission()
    {
        Gate::shouldReceive('denies')
            ->with('access_user_management')
            ->andReturn(true);

        $response = $this->get(route('users.index'));

        $response->assertStatus(403);
    }

    public function test_index_renders_view_if_user_has_permission()
    {
        Gate::shouldReceive('denies')
            ->with('access_user_management')
            ->andReturn(false);

        $dataTable = $this->createMock(UsersDataTable::class);
        $dataTable->expects($this->once())
            ->method('render')
            ->with('user::users.index')
            ->willReturn('rendered view');

        $controller = new UsersController();
        $response = $controller->index($dataTable);

        $this->assertEquals('rendered view', $response);
    }
}
