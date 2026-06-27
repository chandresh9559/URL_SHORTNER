<?php

namespace App\Http\Controllers;

use App\Models\Company;
use App\Models\ShortUrl;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Symfony\Component\HttpFoundation\StreamedResponse;

class UserController extends Controller
{
    //Function to manage all the dashboard records
    public function index(Request $request) {
        $user = Auth::user();
        $perPage = 10;
        $sortByDate = $request->input('sort_by_date');

        if ($user->role == 'superadmin') {
            $companies = Company::withCount(['users', 'shortUrls'])->withSum('shortUrls', 'hits')->paginate($perPage);
            $shortUrls = $this->getFilteredShortUrls($user, $sortByDate, $perPage);
            return view('dashboard', compact('companies', 'shortUrls'));
        }

        if ($user->role == 'admin') {
            $users = User::withCount('shortUrls')
            ->withSum('shortUrls', 'hits')
            ->where('company_id', $user->company_id)
            ->paginate($perPage);

            $shortUrls = $this->getFilteredShortUrls($user, $sortByDate, $perPage);

            return view('dashboard', compact('users', 'shortUrls'));
        }

        if (in_array($user->role, ['sales', 'manager'])) {
            $shortUrls = $this->getFilteredShortUrls($user, $sortByDate, $perPage);

            return view('dashboard', compact('shortUrls'));
        }

        if ($user->role == 'member') {
            $shortUrls = $this->getFilteredShortUrls($user, $sortByDate, $perPage);

            return view('dashboard', compact('shortUrls'));
        }
    }

    //Function to reduce and reuse the code and maange the pagination
    private function getFilteredShortUrls($user, $sortByDate, $perPage)
    {
        $query = ShortUrl::with('user');

        if (in_array($user->role, ['admin', 'sales', 'manager'])) {
            $query->where('company_id', $user->company_id);
        } elseif ($user->role == 'member') {
            $query->where('user_id', '!=', $user->id);
        }

        if ($sortByDate === 'today') {
            $query->whereDate('created_at', now()->toDateString());
        } elseif ($sortByDate === 'last_week') {
            $query->whereBetween('created_at', [now()->subWeek()->startOfDay(), now()->endOfDay()]);
        } elseif ($sortByDate === 'last_month') {
            $query->whereBetween('created_at', [now()->subMonth()->startOfDay(), now()->endOfDay()]);
        }

        return $query->orderByDesc('created_at')->paginate($perPage)->appends(['sort_by_date' => $sortByDate]);
    }

    //Function to add company for the superadmin
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

    //function to add team member
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

    //Function to generate short url
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

    //Function to download the record of short url page
    public function downloadUrls(Request $request): StreamedResponse
    {
        $user = Auth::user();
        $sortByDate = $request->input('sort_by_date');

        $query = ShortUrl::with('user')->orderByDesc('created_at');

        if (in_array($user->role, ['admin', 'sales', 'manager'])) {
            $query->where('company_id', $user->company_id);
        } elseif ($user->role == 'member') {
            $query->where('user_id', '!=', $user->id);
        }

        if ($sortByDate === 'today') {
            $query->whereDate('created_at', now()->toDateString());
        } elseif ($sortByDate === 'last_week') {
            $query->whereBetween('created_at', [now()->subWeek()->startOfDay(), now()->endOfDay()]);
        } elseif ($sortByDate === 'last_month') {
            $query->whereBetween('created_at', [now()->subMonth()->startOfDay(), now()->endOfDay()]);
        }

        $shortUrls = $query->get();

        $filename = 'short-urls-' . now()->format('Y-m-d-H-i-s') . '.csv';

        $headers = [
            'Content-Type' => 'text/csv; charset=UTF-8',
            'Content-Disposition' => 'attachment; filename="' . $filename . '"',
            'Pragma' => 'no-cache',
            'Cache-Control' => 'must-revalidate, post-check=0, pre-check=0',
            'Expires' => '0',
        ];

        return response()->stream(function () use ($shortUrls) {
            $handle = fopen('php://output', 'w');
            fputcsv($handle, ['Short Code', 'Original URL', 'Hits', 'Generated By', 'Created On']);

            foreach ($shortUrls as $url) {
                fputcsv($handle, [
                    $url->short_code ?? 'N/A',
                    $url->original_url ?? 'N/A',
                    $url->hits ?? 0,
                    $url->user->name ?? 'N/A',
                    $url->created_at ? $url->created_at->format('Y-m-d H:i:s') : 'N/A',
                ]);
            }

            fclose($handle);
        }, 200, $headers);
    }

    //Function to open the original url using short code
    public function openUrl($shortCode)
    {
        $shortUrl = ShortUrl::where('short_code', $shortCode)->firstOrFail();

        $shortUrl->increment('hits');

        return redirect()->away($shortUrl->original_url);
    }
}
