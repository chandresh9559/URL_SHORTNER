<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;

class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  Closure(Request): (Response)  $next
     */
    public function handle(Request $request, Closure $next, string $roles): Response
    {
        $user = Auth::user();

        if (! $user) {
            return redirect('/');
        }

        $allowedRoles = collect(explode(',', $roles))
            ->map(fn ($role) => strtolower(trim($role)))
            ->filter()
            ->all();

        $userRole = strtolower((string) $user->role);

        if (! in_array($userRole, $allowedRoles, true)) {
            return redirect()->route('dashboard');
        }

        return $next($request);
    }
}
