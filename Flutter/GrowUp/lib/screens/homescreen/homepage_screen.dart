import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:growup/colorpalettes/palette.dart';
import 'package:growup/screens/drawerscreen/drawer_screen.dart';
import 'package:growup/screens/homescreen/hometab_screen.dart';
import 'package:growup/screens/newsfeedscreen/newsfeed.dart';
import 'package:growup/screens/postscreen/postImage.dart';
import 'package:growup/screens/profilescreen/profile_screen.dart';
import 'package:growup/services/apipractice.dart';
import 'package:iconsax/iconsax.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;
  bool isDrawerOpen = false;
  double xOffset = 0;
  double yOffset = 0;
  bool tabIsSelected = false;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerScreen(),
        appBar: AppBar(
          backgroundColor: darkBlueColor,
          title: const Text("GrowUp"),
          actions: [
            SizedBox(
                height: 25,
                width: 50,
                child: IconButton(
                    onPressed: () {
                      getPracticeQuestions();
                    },
                    icon: const Icon(
                      Iconsax.notification,
                    ))),
          ],
          // centerTitle: true,
        ),
        body: Container(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: <Widget>[
              HomeTabScreen(),
              const NewsFeed(),
              // HomePage(),
              PostScreen(),
              Profile()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: darkBlueColor,
          selectedIndex: _selectedIndex,
          // showElevation: false,

          onItemSelected: (index) => setState(() {
            tabIsSelected = true;
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
                icon: const Icon(Iconsax.home_1),
                title: const Text(
                  'Home',
                  style: TextStyle(fontSize: 18),
                ),
                activeColor: Colors.white,
                inactiveColor: Colors.white),
            BottomNavyBarItem(
                icon: const Icon(Iconsax.activity),
                title: const Text(
                  'Feed',
                  style: TextStyle(fontSize: 18),
                ),
                activeColor: Colors.white,
                inactiveColor: Colors.white),
            BottomNavyBarItem(
                icon: const Icon(Iconsax.add_square),
                title: const Text(
                  'Post',
                  style: TextStyle(fontSize: 18),
                ),
                inactiveColor: Colors.white,
                activeColor: Colors.white),
            BottomNavyBarItem(
                icon: const Icon(Iconsax.personalcard),
                title: const Text(
                  'Profile',
                  style: TextStyle(fontSize: 18),
                ),
                inactiveColor: Colors.white,
                activeColor: Colors.white),
          ],
        ));
  }

  _buildPage({IconData? icon, String? title, Color? color}) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 200.0, color: Colors.white),
            Text(title!,
                style: const TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
