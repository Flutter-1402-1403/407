import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_totarial/ass/login/PrivacyNotice.dart';

import 'package:flutter/material.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const OgCard(),
    );
  }
}

class OgCard extends StatefulWidget {
  const OgCard({super.key});

  @override
  State<OgCard> createState() => _OgCardState();
}

class _OgCardState extends State<OgCard> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset("assets/imdb1.png"),
              )
            ],
          ),
          actions: const <Widget>[
            // add the icon to this list
            Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ],
          backgroundColor: const Color(0xFFF5C418)),
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
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.video_collection_outlined, color: Colors.white),
            label: 'Discover',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
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
                child: Image.asset("assets/shogun.jpg"),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      width: 14,),
                    Image.asset(
                      "assets/intro.png",
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text(
                      "The best week",
                      style: TextStyle(
                          color: Color(0xFFF5C418),
                          fontSize: 18.5,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.normal),
                    ),
                    const Column(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 255, 247, 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
                                  const SizedBox(
                      width: 14,),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 13,horizontal:17),
                height: 184,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/unsplash0.png',
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
                          Image.asset('assets/unsplash1.png'),
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
                          Image.asset('assets/unsplash8.png'),
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
                          Image.asset('assets/unsplash2.png'),
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
                          Image.asset('assets/unsplash3.png'),
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
                          Image.asset('assets/unsplash4.png'),
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
                          Image.asset('assets/unsplash5.png'),
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
                          Image.asset('assets/unsplash6.png'),
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
                          Image.asset('assets/unsplash7.png'),
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
                          Image.asset('assets/unsplash9.png'),
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
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hi!',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
          },
        ),
      ][currentPageIndex],
    );
  }
}
    //messageBox
    //  void _showAlertDialog(BuildContext context) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: const Text('Alert Dialog Title'),
    //         content: const Text('This is the content of the alert dialog.'),
    //         actions: <Widget>[
    //           TextButton(
    //             child: const Text('Cancel'),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //           TextButton(
    //             child: const Text('Confirm'),
    //             onPressed: () {
    //               // Handle the confirm action
    //                Get.to(OgCard());
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }
 