import 'package:flutter/material.dart';
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
          title: const Row(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "IMDb",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
            margin: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  child:
                      Image.asset("assets/shogun.jpg", width: double.infinity),
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                    child: Image.asset("assets/intro.jpg",
                        width: double.infinity)),
              ],
            )),

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
 