<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ShortUrl;
use App\Models\User;

class Company extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'email'];

    public function users() {
        return $this->hasMany(User::class, 'company_id');
    }

    public function shortUrls() {
        return $this->hasMany(ShortUrl::class, 'company_id');
    }
}
