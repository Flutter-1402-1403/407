<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class RegisterController extends Controller
{
    public function store(Request $request)
    {
        $msg = "";
        $users = User::where('email', $request->email)->orWhere('phone', $request->phone)->first();
        if (empty($users->id)) {
            if (preg_match("/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/", $request->email)) {
                if (preg_match('/^(\+98|0)?9\d{9}$/', $request->phone)) {
                    User::create([
                        'fullname' => $request->fullname,
                        'email' => $request->email,
                        'password' => $request->password,
                        'phone' => $request->phone,
                    ]); 
                    $msg = "success " . $request->fullname;
                } else {
                    $msg = "phone number invalid";
                }
            } else {
                $msg = "email does not exist or was misspelled";
            }
        } else {
            $msg = "email or phone number already exist";
        }

        return response()->json($msg);
    }
}
