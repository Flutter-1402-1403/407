import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_totarial/og.dart';
import 'package:login_totarial/sign_up.dart';

String register = "register";

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: const BoxConstraints(),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 100),
                        Image.asset("assets/imdb.png"),
                        const SizedBox(height: 100),
                        Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 44),
                            height: 500,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    label: const Text('Email'),
                                    hintText: 'Enter Your Email',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
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
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
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
                                  height: 22,
                                ),
                                SizedBox(
                                  height: 65,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.to(const OgCard());
                                      //what this bottun do
                                     //agha amir inja

                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        foregroundColor: Colors.black,
                                        backgroundColor:
                                            const Color(0xFFFFC107),
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                        )),
                                    child: const Text("login"),
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
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          foregroundColor: Colors.black,
                                          backgroundColor: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          textStyle: const TextStyle(
                                            fontSize: 20,
                                          ))),
                                ),
                                const SizedBox(
                                  height: 33,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Don't have an account ?",
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(width: 35,),
                                    ElevatedButton(
                                      onPressed: () { Get.to(const SignUpCard());},
                                      child: const Text("register"),
                                      style: ElevatedButton.styleFrom(
                                      //  alignment: marginAll(20,),
                                        
                                      )
                                    )
                                  ],
                                )

                                // new InkWell(
                                //   child: new Text("data"),
                                //   onTap: (){}
                                // )
                              ],
                            ))
                      ],
                    )))));
  }
}
