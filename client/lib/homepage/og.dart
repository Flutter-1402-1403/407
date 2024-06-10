import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:login_totarial/homepage/movie_information.dart';
import 'package:login_totarial/homepage/profile.dart';
import 'package:login_totarial/homepage/browes.dart';
import 'package:login_totarial/homepage/homepage.dart';
import 'package:login_totarial/homepage/rating.dart';
import 'package:login_totarial/login/resource.dart';

int currentPageIndex = 0;
class OgCard extends StatefulWidget {
  const OgCard({super.key});

  @override
  State<OgCard> createState() => _OgCardState();
}

class _OgCardState extends State<OgCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined, color: Colors.white),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search_outlined),
            icon: Icon(Icons.search_outlined, color: Colors.white),
            label: 'Browser',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_2_outlined),
            icon: Icon(Icons.person_2_outlined, color: Colors.white),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        MyWidget(),
        /// Browser page
        MovieListPage(),
        /// Profile page
        UserProfilePage(),
      ][currentPageIndex],
    );
  }
}
