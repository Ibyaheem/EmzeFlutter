import 'package:airbnb_clone/Constants/Constants.dart';
import 'package:airbnb_clone/Routes/SearchScreen.dart';
import 'package:airbnb_clone/Routes/profile_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/ImageView.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(
    initialPage: 1,
  );
  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      setState(() {});
    });
    List<Widget> properties = [
      new ImageProperty(false, Constants.properties[1]),
      new ImageProperty(false, Constants.properties[0]),
      //_buildPadding(),
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: MyHeaderDrawer(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 90.0,
                              height: 90.0,
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Drawer(
                                            child: MyHeaderDrawer(),
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Image(
                                      image: AssetImage(
                                          'assets/profilePicture.png'),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchScreen()),
                              );
                            },
                            splashColor: Colors.white,
                            hoverColor: Constants.greenAirbnb,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black87),
                              ),
                              width: 270.0,
                              height: 60,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Icon(Icons.search),
                                    Text(
                                      "search locations, tourist sites",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.black54),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TabBar(tabs: [
                      Tab(
                        icon: Icon(
                          Icons.car_rental,
                          color: Colors.redAccent,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.place,
                          color: Colors.redAccent,
                        ),
                      ),
                    ]),
                    // TabBarView(children: [
                    //   Container(
                    //     child: Center(
                    //       child: Text('Cars'),
                    //     ),
                    //   ),
                    //   Container(
                    //     child: Center(
                    //       child: Text('Places'),
                    //     ),
                    //   ),
                    // ]),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(
                              "assets/images/landing_page_img.png",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                  child: Text("Explore",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))),
                              Center(
                                  child: Text("Algeria",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white))),
                            ],
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: MaterialButton(
                              onPressed: () {
                                /*  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Photo()),
                                    );*/
                              },
                              elevation: 3,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 40),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    "Check now!",
                                    style: TextStyle(color: Colors.red),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      height: 400,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Emze",
                                  style: TextStyle(color: Color(0xfff35e0b)),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10, right: 10, left: 10),
                            child: Text(
                              "Meet people all over Algeria and discover the most beautiful places in the country. With Emze.",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xffd3d3d3)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: PageView(
                                scrollDirection: Axis.horizontal,
                                controller: controller,
                                children: <Widget>[
                                  buildScrollActivities("the best holidays",
                                      "assets/images/3.jpg"),
                                  buildScrollActivities(
                                      "Family housing", "assets/images/4.jpg"),
                                  buildScrollActivities(
                                      "Quiet places", "assets/images/1.jpg"),
                                  buildScrollActivities(
                                      "Quiet places", "assets/images/2.jpg"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      for (Widget prop in properties) prop,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildScrollActivities(String text, String imgUri) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          Container(
              color: Colors.white,
              height: 250,
              width: 350,
              child: Image.asset(
                imgUri,
                fit: BoxFit.fill,
              )),
          Container(
              width: double.infinity,
              color: Colors.black,
              child: Text(
                text,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
