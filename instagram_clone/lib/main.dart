import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/icons/custom_icons.dart';
import 'package:instagram/screens/feed_page.dart';
import 'package:instagram/screens/newPostPage.dart';
import 'package:instagram/screens/reelsPage.dart';
import 'package:instagram/screens/searchPage.dart';
import 'package:instagram/screens/userPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      home: HomePage(title: "Instagram",),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    FeedPage(),
    SearchPage(),
    NewPostPage(),
    ReelsPage(),
    UserPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('images/ic_reels_unselected.svg', width: 20, height: 20,),//ㄴImage.asset('images/ic_reels_unselected.svg', width: 10, height: 1,),
            activeIcon: SvgPicture.asset("images/ic_reels_selected.svg", width: 20, height: 20,),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
