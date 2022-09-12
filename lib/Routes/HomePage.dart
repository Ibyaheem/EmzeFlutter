import 'package:airbnb_clone/Constants/Constants.dart';
import 'package:airbnb_clone/Routes/Messages.dart';
import 'package:airbnb_clone/Routes/Properties.dart';
import 'package:airbnb_clone/Routes/homeScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

void main() => runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          theme: ThemeData(
              primaryColor: Constants.greenAirbnb,
              accentColor: Constants.redAirbnb,
              scaffoldBackgroundColor: Colors.orange[400])),
    );

class HomePageState extends State<HomePage> {
  int _currentTab = 0;
  List<Widget> _children = [
    HomeScreen(),
    Properties(),
    Messages(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE7EBEE),
      body: SafeArea(
        child: _children[_currentTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          selectedItemColor: Color(0xff783c7e),
          unselectedItemColor: Colors.grey[800],
          type: BottomNavigationBarType.fixed,
          onTap: (int value) {
            setState(() {
              _currentTab = value;
            });
          },
          currentIndex: _currentTab,
          items: [
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/icon.jpg'),
                width: 30.0,
                height: 30.0,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                //color: Colors.black,
                size: 30,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble_outline,
                size: 30,
              ),
              label: 'messages',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.person_outline,
            //     size: 30,
            //   ),
            //   label: 'My profile',
            // ),
          ]),
    );
  }
}
