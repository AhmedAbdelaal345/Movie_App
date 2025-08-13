import 'package:flutter/material.dart';
import 'package:movie_app/helper/themes/app_color.dart';
import 'package:movie_app/view/pages/home_page.dart';
import 'package:movie_app/view/pages/watched_list_page.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({super.key});

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  int _currentIndex = 0;
  
  final List<Widget> _pages = [
    const HomePage(),
    const WatchedListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.pirmaryTextColor,
        unselectedItemColor: AppColor.secondaryTextColor,
        backgroundColor: AppColor.backGroundColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Watched',
          ),
        ],
      ),
    );
  }
}