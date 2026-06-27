<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Company;
use App\Models\User;

class ShortUrl extends Model
{
    use HasFactory;
    protected $fillable = ['company_id', 'user_id', 'original_url', 'short_code'];

    public function company(){
        return $this->belongsTo(Company::class, 'company_id');
    }

    public function user() {
        return $this->belongsTo(User::class, 'user_id');
    }
}
