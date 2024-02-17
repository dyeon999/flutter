import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int totalSeconds = 1500;
  bool isRunning = false;
  late Timer timer;

  void onTick(Timer timer){
    setState(() {
      totalSeconds -= 1;
    });
  }

  void onStartPressed(){
    timer = Timer.periodic(
      Duration(seconds: 1), onTick,
    );
    setState((){
      isRunning = true;
    });
  }

  void onPausePressed(){
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text("$totalSeconds",
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                iconSize: 98,
                color: Theme.of(context).cardColor,
                onPressed: isRunning? onPausePressed : onStartPressed,
                icon: Icon(isRunning? Icons.pause_circle_outline : Icons.play_circle_outline),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).cardColor
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Theme.of(context). textTheme.headline1!.color
                          ),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 58,
                              color: Theme.of(context).textTheme.headline1!.color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}