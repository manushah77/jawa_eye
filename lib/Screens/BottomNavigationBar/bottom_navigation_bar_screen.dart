import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:jawa_eye/Constant/color.dart';
import 'package:jawa_eye/Screens/BottomNavigationBar/HomeScreen/home_screen.dart';
import 'package:jawa_eye/Screens/BottomNavigationBar/UserProfile/user_profile.dart';
import 'package:jawa_eye/Screens/LoginScreen/login_screen.dart';
import 'package:jawa_eye/Screens/SignupScreen/signup_screen.dart';

import 'WatchMovies/watch_movies.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _index = 0;

  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _children = [
    HomeScreen(),
    WatchMovies(),
    UserProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: _index,
          height: 50.0,
          items: <Widget>[

            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.emergency_recording_rounded,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ],
          color: Colors.black54,
          buttonBackgroundColor: Colors.black54,
          backgroundColor:primaryColor,
          animationCurve: Curves.easeIn,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            print(index);
            setState(() {
              _index = index;
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            });
          },
        ),
      body: SizedBox.expand(
        child: Container(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _index = index);
            },
            children: _children,
          ),
        ),
      ),
    );
  }
}
