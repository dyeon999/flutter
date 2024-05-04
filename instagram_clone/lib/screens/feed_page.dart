import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/icons/custom_icons.dart';

class FeedPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Icon(Icons.favorite_outline_outlined, size: 22),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 20),
            child: Icon(Icons.message, size: 22),
          ),
        ],
        leading: IconButton(icon: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Icon(CustomIcons.instagram_logo_black, size: 27, ),
        ), onPressed: () {},),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Row(
                children: [
                  Text("스토리 스토리 스토리")
                ],
              ),
              Column(
                //유저 정보
              )
            ],
          ),
        ),
      ),
    );
  }

}