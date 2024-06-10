import 'package:flutter/material.dart';
import 'package:imdb/pages/main/rating.dart';
import 'package:imdb/pages/resource/resource.dart';
import 'package:imdb/routing/auth/condition_of_use.dart';
import 'package:imdb/routing/auth/privacy_notice.dart';
import 'package:imdb/routing/auth/forgot_password.dart';
import 'package:imdb/routing/auth/register.dart';
import 'package:imdb/routing/main/main.dart';
import 'package:toastification/toastification.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool remember_me = false;
  bool password_show = true;
  bool isLoading = false;
  IconData password_icon = Icons.visibility;
  final loginUsername = TextEditingController();
  final loginPassword = TextEditingController();
  final _logincardKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              heading('Sign in'),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _logincardKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: loginUsername,
                        validator: (value) {
                          RegExp emailRegex =
                              RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Email';
                          } else if (!emailRegex.hasMatch(value)) {
                            return 'Your Email is wrong';
                          }
                          return null;
                        },
                        decoration: input('Email', 'Enter Your Email'),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: loginPassword,
                        validator: (value) {
                          RegExp Password2Regex =
                              RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*\w).{8,}$');
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Password';
                          } else if (!Password2Regex.hasMatch(value)) {
                            return "Your Password Is Wrong";
                          }
                          return null;
                        },
                        obscureText: password_show,
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          hintText: 'Enter Your Password',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (password_show == true) {
                                  password_show = false;
                                  password_icon = Icons.visibility_off;
                                } else {
                                  password_show = true;
                                  password_icon = Icons.visibility;
                                }
                              });
                            },
                            icon: Icon(password_icon),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1,
                                child: Checkbox(
                                  value: remember_me,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      remember_me = value!;
                                    });
                                  },
                                  checkColor: Colors.black,
                                  activeColor: const Color(0xFFF5C418),
                                ),
                              ),
                              checkbox("Remember Me", 15)
                            ],
                          ),
                          txtbtn('Forgot Password?', () => Get.to(const ForgotPassword())),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Container(
                        width: double.infinity,
                        decoration: shadowbtn(),
                        child: ElevatedButton(
                          onPressed: isLoading ? null : () async {
                            if (_logincardKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });

                              try {
                                final response = await http.post(
                                  Uri.parse('http://192.168.43.154/api/login'),
                                  headers: {
                                    HttpHeaders.contentTypeHeader:
                                        'application/json; charset=UTF-8',
                                  },
                                  body: jsonEncode({
                                    'username': loginUsername.text,
                                    'password': loginPassword.text,
                                  }),
                                );

                                if (response.statusCode == 200) {
                                  toastification.show(
                                    backgroundColor: Colors.green,
                                    context: context,
                                    title:
                                        const Text("Login successfully"),
                                    autoCloseDuration:
                                        const Duration(seconds: 3),
                                  );
                                  Get.to(Main());
                                } else {
                                  toastification.show(
                                    backgroundColor: Colors.red,
                                    context: context,
                                    title:
                                        const Text("The information is invalid"),
                                    autoCloseDuration:
                                        const Duration(seconds: 3),
                                  );
                                }
                              } catch (error) {
                                toastification.show(
                                  backgroundColor: Colors.red,
                                  context: context,
                                  title:
                                      const Text("An error occurred"),
                                  autoCloseDuration:
                                      const Duration(seconds: 3),
                                );
                              } finally {
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            } else {
                              toastification.show(
                                backgroundColor: Colors.red,
                                context: context,
                                title:
                                    const Text("The information is invalid"),
                                autoCloseDuration:
                                    const Duration(seconds: 3),
                              );
                            }
                            Get.to(Main());
                          },
                          style: stylebtn(Colors.black, const Color(0xFFF6B100),
                              20, 30, 15),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(Colors.white),
                                )
                              : const Text("Login"),
                        ),
                      ),
                      const SizedBox(height: 25),
                      linetxtlogin('New to IMDb ?'),
                      const SizedBox(height: 25),
                      Container(
                        width: double.infinity,
                        decoration: shadowbtn(),
                        child: ElevatedButton(
                          onPressed: () async {
                            Get.to(const Register());
                          },
                          style:
                              stylebtn(Colors.white, Colors.black, 20, 30, 15),
                          child: const Text("Create Account"),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          txtbtn('Conditions of Use', () => Get.to(const ConditionOfUse()),),
                          txtbtn('Privacy Notice',() => Get.to(const PrivacyNotice())),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
