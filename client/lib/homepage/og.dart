import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_totarial/homepage/movie_information.dart';

class OgCard extends StatefulWidget {
  const OgCard({super.key});

  @override
  State<OgCard> createState() => _OgCardState();
}

class _OgCardState extends State<OgCard> {
  int currentPageIndex = 1;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    //  final ThemeData theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.black,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          void _onItemTapped(int index) {
            setState(
              () {
                _selectedIndex = index;
              },
            );
          }
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
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(0),
          child: Column(
            children: [
              SizedBox(
                child: ClipRRect(
                  child: Image.asset("assets/images/shogun.jpg",
                      width: 420, height: 280, fit: BoxFit.fill),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Align(
                //alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          width: 12,
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset(
                            "assets/images/intro.png",
                            height: 150,
                          ),
                        ),
                        const SizedBox(width: 30),
                        const Column(
                          children: [
                            Text(
                              '''The best week''',
                              style: TextStyle(
                                  color: Color(0xFFF5C418),
                                  fontSize: 18.5,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.normal),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 255, 152, 17),
                                ),
                                Text(
                                  "9.2",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.5,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "/10",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('آواتار'),
            ),
            label: Text('این یک چیپ است'),
                          )],
                        )
                      ],
                    ),
                    //const SizedBox(width: 14),
                    Row(
                      children: [
                        const SizedBox(width: 14),
                        const Text(
                          "Top 10 on IMDb this week",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(const MovieInformation());
                          },
                          child: const Text(
                            "See more",
                            style: TextStyle(
                                color: Color(0xFFF5C418),
                                fontSize: 15,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 17),
                height: 184,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/unsplash0.png',
                          ),
                          const Text(
                            'Poor thing',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/unsplash1.png'),
                          const Text(
                            'Oppenheimer',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/unsplash8.png'),
                          const Text(
                            'Barbie',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/unsplash2.png'),
                          const Text(
                            'Dune:  part two',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/unsplash3.png'),
                          const Text(
                            'Shogun',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/unsplash4.png'),
                          const Text(
                            'Wanda Vision',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/unsplash5.png'),
                          const Text(
                            'Moon Knight',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/unsplash6.png'),
                          const Text(
                            'Daredevil',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/unsplash7.png'),
                          const Text(
                            'The Sandman',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/images/unsplash9.png'),
                          const Text(
                            'Stranger things',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        /// Notifications page
        const Text("Browser"),

        /// Messages page
        const Text("profile")
      ][currentPageIndex],
    );
  }
}
