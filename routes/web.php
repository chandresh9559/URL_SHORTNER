<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

Route::get('/', function () {
    if (Auth::check()) {
        return redirect()->route('dashboard');
    }

    return view('auth.login');
});

Route::get('/dashboard', [UserController::class, 'index'])
    ->middleware(['auth', 'verified'])
    ->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::get('/invite-company', function () {
    return view('superadmin_invite');
})->middleware(['auth', 'role:superadmin'])->name('superadmin.inviteCompany');
Route::post('/invite-company-add',[UserController::class, 'addCompany'])->middleware(['auth', 'role:superadmin'])->name('superadmin.addCompany');

Route::get('/invite-team-member', function () {
    return view('admin_invite');
})->middleware(['auth', 'role:admin'])->name('admin.inviteTeamMember');
Route::post('/invite-team-add', [UserController::class, 'addTeamMember'])->middleware(['auth', 'role:admin'])->name('admin.addTeamMember');


Route::get('/generate-url', function () {
    return view('shorturl_generate');
})->middleware(['auth', 'role:admin,member,sales,manager'])->name('admin.generateUrl');
Route::post('/generate-url', [UserController::class, 'generateShortUrl'])->middleware(['auth', 'role:admin,member,sales,manager'])->name('admin.generateShortUrl');


Route::get('/download-urls', [UserController::class, 'downloadUrls'])->middleware(['auth', 'role:admin,member,sales,manager'])->name('admin.downloadUrls');

Route::get('/short-url/open/{shortCode}', [UserController::class, 'openUrl'])
    ->middleware('auth')->name('shorturl.open');

require __DIR__.'/auth.php';
