import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  final List<String> imgList = [
    'assets/images/shogun.jpg',
    'assets/images/shogun.jpg',
    'assets/images/shogun.jpg',
  ];

  List<Widget> imageSliders() {
    return imgList
        .map((item) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shogun',
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 15,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
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
                             
                            },
                            child: Text('See More'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }

  Widget _buildListItem(String imagePath, String title) {
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

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
                              labelPadding:
                                  EdgeInsets.symmetric(horizontal: 8),
                              labelStyle: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Chip(
                              label: Text('History'),
                              backgroundColor:
                                  Color.fromARGB(255, 213, 213, 213),
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
                              labelPadding:
                                  EdgeInsets.symmetric(horizontal: 8),
                              labelStyle: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return _buildListItem(
                    'assets/images/unsplash${index}.png', 'Title $index');
              },
            ),
          )
        ],
      ),
    );
  }
}


