import 'package:androidstudio_project/data/users_data.dart';
import 'package:androidstudio_project/model/user_model.dart';
import 'package:androidstudio_project/screens/home_screen.dart';
import 'package:androidstudio_project/screens/profile_screen.dart';
import 'package:androidstudio_project/screens/reels_screen.dart';
import 'package:androidstudio_project/screens/upload_screen.dart';
import 'package:flutter/material.dart';

import 'explore_screen.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  List<UserModel> user = [];
  int currentBottomNavIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const ExploreScreen(),
    const UploadScreen(),
    const ReelsScreen(),
    const ProfileScreen()
  ];

  @override
  void initState() {
    for (int i = 0; i < UserData.instance.users.length; i++) {
      user.add(UserModel.fromJson(UserData.instance.users[i]));
    }
    super.initState();
  }

  void onTapped(int index) => setState(() {
        currentBottomNavIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[currentBottomNavIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentBottomNavIndex,
        indicatorColor: Colors.transparent,
        onDestinationSelected: (int index) {
          setState(() {
            currentBottomNavIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined, color: Colors.black, size: 30),
              selectedIcon:
                  Icon(Icons.home_filled, color: Colors.black, size: 30),
              label: ""),
          NavigationDestination(
              icon: Icon(Icons.search_outlined,
                  weight: 900, color: Colors.black, size: 30),
              selectedIcon:
                  Icon(Icons.search_outlined, color: Colors.black, size: 30),
              label: ""),
          NavigationDestination(
              selectedIcon: Icon(Icons.add_box, color: Colors.black, size: 30),
              icon: Icon(Icons.add_box_outlined, color: Colors.black, size: 30),
              label: ""),
          NavigationDestination(
              selectedIcon:
                  Icon(Icons.movie_creation, color: Colors.black, size: 30),
              icon: Icon(Icons.movie_outlined, color: Colors.black, size: 30),
              label: ""),
          NavigationDestination(
              selectedIcon: Icon(Icons.circle, color: Colors.black, size: 32),
              icon: Icon(Icons.circle, color: Colors.black, size: 30),
              label: ""),
        ],
      ),
    );
  }
}
