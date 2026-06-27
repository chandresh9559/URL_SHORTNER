<?php

namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\ShortUrl;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserController extends Controller
{
    public function index() {
        $user = Auth::user();

        if ($user->role == 'superadmin') {
            $companies = Company::withCount(['users', 'shortUrls'])->get();

            return view('dashboard', compact('companies'));
        }

        if ($user->role == 'admin') {
            $users = User::withCount('shortUrls')
            ->withSum('shortUrls', 'hits')
            ->where('company_id', $user->company_id)
            ->get();

            $shortUrls = ShortUrl::with('user')
            ->where('company_id', $user->company_id)
            ->get();

            return view('dashboard', compact('users', 'shortUrls'));
        }

        if (in_array($user->role, ['sales', 'manager'])) {
            $shortUrls = ShortUrl::where('company_id', $user->company_id)->get();

            return view('dashboard', compact('shortUrls'));
        }

        if ($user->role == 'member') {
            $shortUrls = ShortUrl::where('user_id', '!=', $user->id)->get();

            return view('dashboard', compact('shortUrls'));
        }
    }

    public function addCompany(Request $request) {
        $request->validate([
            'name' => 'required',
            'email' => 'required'
        ]);

        Company::create([
            'name' => $request->name,
            'email' => $request->email
        ]);

        return redirect()->route('dashboard')->with('message', 'Company added successfully');
    }

    public function addTeamMember(Request $request) {
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'role' => 'required'
        ]);

        User::create([
            'company_id' => Auth::user()->company_id,
            'name' => $request->name,
            'email' => $request->email,
            'role' => $request->role,
            'password' => Hash::make('password')
        ]);

        return redirect()->route('dashboard')->with('message', 'User added successfully');
    }

    public function generateShortUrl(Request $request) {
        $request->validate([
            'long_url' => 'required'
        ]);

        ShortUrl::create([
            'company_id' => Auth::user()->company_id,
            'user_id' => Auth::user()->id,
            'original_url' => $request->long_url,
            'short_code' => Str::random(6)
        ]);

        return redirect()->route('dashboard')->with('message', 'Short url generated successfully');
    }
}
