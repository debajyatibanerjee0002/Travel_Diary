import 'package:flutter/material.dart';
import 'package:minimal_travel_diary/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  List<String> photos = [
    'assets/nature1.jpg',
    'assets/nature2.jpg',
    'assets/nature3.jpg',
    'assets/nature4.jpg',
    'assets/nature5.jpg',
    'assets/nature6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
            child: TabBar(
              isScrollable: false,
              controller: tabController,
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.home_rounded, color: Colors.black)),
                Tab(icon: Icon(Icons.search, color: Colors.grey)),
                Tab(icon: Icon(Icons.graphic_eq, color: Colors.grey)),
                Tab(icon: Icon(Icons.add_circle_outline, color: Colors.grey)),
              ],
            )),
        backgroundColor: Colors.blue[100],
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Travel',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        Icons.check_circle_rounded,
                        color: Colors.grey[700],
                        size: 17,
                      ),
                      Text(
                        'gram',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.grey[700],
                      ),
                      SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              spreadRadius: -0.20,
                              color: Colors.black,
                            ),
                          ],
                          // color: Colors.green[50],
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Hero(
                          tag: 'dibbo',
                          child: CircleAvatar(
                            radius: 20.0,
                            backgroundImage: AssetImage("assets/profile.jpg"),
                            child: GestureDetector(onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30),
              padding: EdgeInsets.all(10.0),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10.0,
                    spreadRadius: -5,
                    color: Colors.black,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.map,
                        color: Colors.green,
                        size: 35,
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LADAKH TRIP 2020',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Add an Update',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 60),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Positioned(
                    left: 5,
                    top: 2,
                    child: Icon(
                      Icons.location_on,
                      size: 25,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'FROM THE COMMUNITY',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            _buildImageGrid(context, photos[0], photos[1], photos[4]),
            _buildImageGrid(context, photos[2], photos[3], photos[5]),
            _buildImageGrid(context, photos[5], photos[4], photos[5]),
            _buildImageGrid(context, photos[1], photos[3], photos[2]),
          ],
        ),
      ),
    );
  }

  Widget _buildImageGrid(
      BuildContext context, String photos1, String photos2, String photos3) {
    return Stack(
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
          child: Container(
            height: 270.0,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 225.0,
                      width: MediaQuery.of(context).size.width / 2 + 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: AssetImage(photos1),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 112.5,
                          width: MediaQuery.of(context).size.width / 2 - 72.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              // bottomRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                              image: AssetImage(photos2),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width / 2 - 72.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              // topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            image: DecorationImage(
                              image: AssetImage(photos3),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, top: 5, right: 15.0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ladakh Trip 2020',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'Dibbo added 20 photos',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Colors.grey[800],
                              ),
                              SizedBox(width: 5),
                              Text(
                                '2h ago',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.send_outlined,
                            size: 20,
                            color: Colors.blue[700],
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.chat_bubble_outline,
                            size: 20,
                            color: Colors.green[400],
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.favorite_border,
                            size: 20,
                            color: Colors.red[700],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 210,
            left: 310,
            child: Text(
              '17+',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ))
      ],
    );
  }
}
