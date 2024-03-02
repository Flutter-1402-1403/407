<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function store(Request $request)
    {
        $msg = "";
        $users = User::where('email', $request->email)->first();
        if (!empty($users->id)) {
            if (Hash::check($request->password, $users->password)) {
                $msg = "success " . $request->email;
            } else {
                $msg = "email or password is not correct";
            }
        } else {
            $msg = "not find username or email";
        }

        return response()->json($msg);
    }
}
