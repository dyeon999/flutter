import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserPage extends StatefulWidget{
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("dd0_0bby", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
        centerTitle: false,
        backgroundColor: Colors.white,
        actions: [
          // const Text("Thread"),
          IconButton(
            visualDensity: VisualDensity(horizontal: -4.0),
            padding: EdgeInsets.zero,
            onPressed: (){},
            icon: SvgPicture.asset('images/ic_newpost_selected.svg', width: 21, height: 20,),
          ),
          IconButton(
            visualDensity: VisualDensity(horizontal: -3.0),
            padding: EdgeInsets.zero,
            onPressed: (){},
            icon: SvgPicture.asset('images/ic_hamburger.svg', width: 14, height: 14,),
          ),
        ],
      ),
      body:  CustomScrollView(
        reverse: false,
        scrollDirection: Axis.vertical,
        slivers: [
          _profileLayout(),
          _tabLayout(),
        ]
      ),

    );
  }

  Widget _profileLayout(){
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //profile image
                Container(
                  width: 80,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset("images/image_profile.jpeg", fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(width: 50,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //게시물 수
                      _info("게시물", "33",),
                      _info("팔로워", "355"),
                      _info("팔로잉","288"),
                    ],
                  ),
                ),
                SizedBox(width: 20,)
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("김도비"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 33,
              child: Row(
                children: [
                  _button("프로필 편집"),
                  SizedBox(
                    width: 10,
                  ),
                  _button("프로필 공유"),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F7F7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: (){},
                      icon: Image.asset("images/ic_recommend_friend.png", width: 40, height: 40,),
                    ),
                  )
                ],
              ),
            ),
            // tabview
            // feeds
          ],
        ),
      ),
    );
  }

  Widget _tabLayout(){
    return SliverToBoxAdapter(
      child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              _tabBar(),
            ],
          ),
      ),
    );
  }

  Widget _tabBar(){
    return TabBar(
        indicatorColor: Colors.black,
        indicatorWeight: 1,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Colors.grey,
        overlayColor: MaterialStatePropertyAll(
          Colors.transparent,
        ),
        tabs: [
          Tab(
            icon: SvgPicture.asset('images/ic_grid_selected.svg', width: 20, height: 20,),
          ),
          Tab(
            icon: SvgPicture.asset('images/ic_mentions_selected.svg', width: 20, height: 20,)
          ),
        ],
    );
  }

  Widget _button(String title){
    return Expanded(
        child: TextButton(
          onPressed: (){print(title);},
          style: TextButton.styleFrom(
            backgroundColor: Color(0xFFF7F7F7),
            foregroundColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            splashFactory: NoSplash.splashFactory,
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        )
    );
  }

  Widget _info(String text, String count){
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        Text(text,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}