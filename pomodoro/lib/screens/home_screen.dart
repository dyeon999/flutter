import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  static const twentyfivemin = 1500;
  int totalSeconds = twentyfivemin;
  bool isRunning = false;
  bool isStopped = true;
  int totalPomodoros = 0;
  late Timer timer;

  void onTick(Timer timer){
    if(totalSeconds == 0){
      setState(() {
        totalPomodoros += 1;
        isRunning = false;
        totalSeconds = twentyfivemin;
      });
      timer.cancel();
    } else{
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  void onStartPressed(){
    timer = Timer.periodic(
      const Duration(seconds: 1), onTick,
    );
    setState((){
      isRunning = true;
      isStopped = false;
    });
  }

  void onPausePressed(){
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onStopPressed(){
    setState(() {
      totalSeconds = twentyfivemin;
      isRunning = false;
      isStopped = true;
    });
    timer.cancel();
  }

  String format(int seconds){
    var duration = Duration(seconds: seconds);
    var timeFormat = duration.toString().split(".").first.substring(2,7);

    print(timeFormat);
    return timeFormat;
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
                child: Text(format(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: IconButton(
                    iconSize: 98,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning? onPausePressed : onStartPressed,
                    icon: Icon(isRunning? Icons.pause_circle_outline : Icons.play_circle_outline),
                  ),
                ),
                Center(
                  child: Visibility(
                    visible: !isStopped,
                    child: IconButton(
                      iconSize: 48,
                      color: Theme.of(context).cardColor,
                      onPressed: onStopPressed,
                      icon: const Icon(Icons.replay),
                    ),
                  ),
                ),
              ],
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
                          "$totalPomodoros",
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