import 'package:flutter/material.dart';

void main() {
  runApp(DigitalClock());
}

class DigitalClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Digital Clock"),
            centerTitle: true,
          ),
          body: Container(
            child: Center(
              child: StreamBuilder(
                  stream: clock(),
                  builder: (context, snapshot) {
                    return Text(snapshot.data.toString(),
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold
                      ),);
                  }
              ),
            ),
          ),
        ),
      ),
    );
  }

  Stream<String> clock() async* {
    await Future<void>.delayed(Duration(milliseconds: 500));
    DateTime now = DateTime.now();
    yield (now.hour < 10 ? "0" + now.hour.toString() : now.hour.toString()) +
        ":" +
        (now.minute < 10 ? "0" + now.minute.toString() : now.minute.toString()) +
        ":" +
        (now.second < 10 ? "0" + now.second.toString() : now.second.toString());
    yield* clock();
  }
}
