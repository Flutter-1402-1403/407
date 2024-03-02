import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_totarial/login_page.dart';
import 'package:login_totarial/og.dart';

class SignUpCard extends StatelessWidget {
  const SignUpCard({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        const SizedBox(height: 10),
        Image.asset("assets/imdb.png"),
        const SizedBox(height: 10),
        Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 44),
            height: 640,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text('Username'),
                    hintText: 'Enter Your Username',
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
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    label: const Text('PhoneNumber'),
                    hintText: 'Enter Your phone Number',
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
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text('Email'),
                    hintText: 'Enter Your Email',
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
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    label: const Text('password'),
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
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      //what this bottun do
                      //inja agha amir
                      Get.to(const OgCard());
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        foregroundColor: Colors.black,
                        backgroundColor: const Color(0xFFFFC107),
                        textStyle: const TextStyle(
                          fontSize: 20,
                        )),
                    child: const Text("sign up"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 65,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        //what this bottun do
                      },
                      child: Text("I forgot my password"),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          foregroundColor: Colors.black,
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            // padding:
                          ))),
                ),
                const SizedBox(
                  height: 33,
                ),
                Row(
                  children: [
                    const Text(
                      "Do you have an account ?",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 35,),
                    ElevatedButton(
                        onPressed: () {
                          Get.to(const LoginCard());
                        },
                        child:  Text("Login"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                               const Color.fromARGB(255, 255, 255, 255))
                               
                               )
                  ],
                )
              ],
            ))
      ]),
    );
  }
}
