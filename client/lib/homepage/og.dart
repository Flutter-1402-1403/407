import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:login_totarial/homepage/movie_information.dart';
import 'package:login_totarial/homepage/rating.dart';
import 'package:login_totarial/login/resource.dart';

class OgCard extends StatefulWidget {
  const OgCard({super.key});

  @override
  State<OgCard> createState() => _OgCardState();
}

class _OgCardState extends State<OgCard> {
  int currentPageIndex = 0;
  int _current = 0;

  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    'assets/images/shogun.jpg',
    'assets/images/shogun.jpg',
    'assets/images/shogun.jpg',
  ];

  List<Widget> imageSliders() {
    return imgList
        .map(
          (item) =>
              //margin: const EdgeInsets.all(5.0),
              ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: 500,
                  height: 500,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'shogun',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'When a mysterious European ship is found marooned in a nearby fishing village, '
                          'Lord Yoshi Toranaga discovers secrets that could tip the scales of power and devastate his enemies.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(const MovieInformation());
                          },
                          style: StyleBtnI(
                            Colors.black,
                            const Color(0xFFF5C418),
                          ),
                          child: const Text('See More'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }

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
        Card(
          shadowColor: const Color.fromARGB(0, 255, 183, 0),
          margin: const EdgeInsets.all(0),
          child: Column(
            children: [
              Expanded(
                child: CarouselSlider(
                  items: imageSliders(),
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 25),
              Align(
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 12),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Row(
                                children: [
                                  Chip(
                                    label: Text('Adventure'),
                                    backgroundColor:
                                        Color.fromARGB(255, 213, 213, 213),
                                    padding: EdgeInsets.all(-4),
                                    labelPadding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Chip(
                                    label: Text('History'),
                                    backgroundColor:
                                        Color.fromARGB(255, 213, 213, 213),
                                    padding: EdgeInsets.all(-4),
                                    labelPadding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Chip(
                                    label: Text('Drama'),
                                    backgroundColor:
                                        Color.fromARGB(255, 213, 213, 213),
                                    padding: EdgeInsets.all(-4),
                                    labelPadding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 10),
                                  Chip(
                                    label: Text('View'),
                                    backgroundColor: Color(0xFFF5C418),
                                    padding: EdgeInsets.all(-4),
                                    labelPadding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    labelStyle: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                children: [],
                              )
                            ],
                          ),
                        ]),
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
                        const SizedBox(width: 100),
                        TextButton(
                          onPressed: () {
                            Get.to(RatingAndReviewsPage());
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
                    _buildListItemm(
                        'assets/images/unsplash0.png', 'Poor thing'),
                    _buildListItemm(
                        'assets/images/unsplash1.png', 'Oppenheimer'),
                    _buildListItemm('assets/images/unsplash8.png', 'Barbie'),
                    _buildListItemm(
                        'assets/images/unsplash2.png', 'Dune: part two'),
                    _buildListItemm('assets/images/unsplash3.png', 'Shogun'),
                    _buildListItemm(
                        'assets/images/unsplash4.png', 'Wanda Vision'),
                    _buildListItemm(
                        'assets/images/unsplash5.png', 'Moon Knight'),
                    _buildListItemm('assets/images/unsplash6.png', 'Daredevil'),
                    _buildListItemm(
                        'assets/images/unsplash7.png', 'The Sandman'),
                    _buildListItemm(
                        'assets/images/unsplash9.png', 'Stranger things'),
                  ],
                ),
              )
            ],
          ),
        ),

        /// Browser page
        const Text("Browser"),

        /// Profile page
        const Text("profile")
      ][currentPageIndex],
    );
  }

  Widget _buildListItemm(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: Column(
        children: <Widget>[
          Image.asset(imagePath),
          Text(
            title,
            style: const TextStyle(
                fontFamily: "Roboto", fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
