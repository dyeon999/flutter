import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lime,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Click Count",
              style: TextStyle(fontSize: 30),),
              Text("$count",
              style: const TextStyle(fontSize: 30),),
              IconButton(onPressed: onClicked,
                  icon: const Icon(Icons.add_box_rounded,
                    size: 50,))
            ],
          ),
        ),
      ),
    );
  }

  void onClicked() {
    setState(() { // 상태가 변했음을 알려주는 함수 -> build method를 다시 실행시킴
      // 변하는 값이 꼭 이 안에 들어갈 필요는 없음
      // 그저 플러터에게 변경사항이 있다는 것을 알려주고 빌드를 다시 실행시키는 것 뿐
      // 하지만 가독성을 위해 안에 넣는 것이 좋겟쥬?
      count += 1;
    });

  }
}