import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title:const Text('IMDB'),
            bottom:const TabBar(
              tabs: [
                Tab(text: 'Login'),
                Tab(text: 'Signup'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LoginCard(),
              SignupCard(),
            ],
          ),
        ),
      ),
         theme: ThemeData(
        primarySwatch: Colors.amber),
        );
  }
}

class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
         margin:const EdgeInsets.all(20.0),
        child: Padding(
          padding:const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[const
              TextField(
                style: TextStyle(backgroundColor: Color.fromARGB(255, 255, 92, 11)),
                decoration: InputDecoration(labelText: 'Email'),
              ),
              const
              SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final response = await http.get(
                    Uri.parse('https://jsonplaceholder.typicode.com/login.php'),
                    headers: {
                      'email': '',
                      'password': ''
                    },
                  );
                },
                child:const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin:const EdgeInsets.all(20.0),
        child: Padding(
          padding:const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
              const
              SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final response = await http.get(
                    Uri.parse('https://jsonplaceholder.typicode.com/signup.php'),
                    headers: {
                      'fullname': '',
                      'email': '',
                      'password': ''
                    },
                  );
                },
                child:const Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}