import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grace/slider.dart';

import 'grace.dart';
import 'joystick.dart';

final myController = TextEditingController();

void main() async {
  // Force landscape device left orientation
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft]);

  // Hide status bar
  await SystemChrome.setEnabledSystemUIOverlays([]);

  /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(3, 44, 115, 1), // status bar color
  ));
*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grace',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(3, 44, 115, 1),
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => HomePage(),
        "/grace_controller": (context) => MyJoystick(),
        "/grace_call": (context) => GraceCall(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color.fromRGBO(3, 44, 115, 1),
          child: Stack(
            children: <Widget>[
              Center(
                  child: Text("Grace",
                      style: TextStyle(fontSize: 32, color: Colors.white))),
              MyButton(
                  x: 14,
                  y: 60,
                  title: "Call",
                  onPressed: () {
                    Navigator.of(context).pushNamed("/grace_call");
                  }),
              MyButton(
                  x: 70,
                  y: 60,
                  title: "Control",
                  onPressed: () {
                    Navigator.of(context).pushNamed("/grace_controller");
                  }),
              TextField(
                controller: myController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({this.x, this.y, this.title, this.onPressed});

  final int x;
  final int y;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (x / 100) * MediaQuery.of(context).size.width,
      top: (y / 100) * MediaQuery.of(context).size.height,
      width: 100,
      height: 70,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.white,
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        heroTag: title,
      ),
    );
  }
}

class GraceCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grace Call"),
      ),
      body: Center(
        child: Text("You are calling Grace!"),
      ),
    );
  }
}

class MyJoystick extends StatelessWidget {
  final BoardGame game = BoardGame(myController.text);
  /*GestureDetector(
    behavior: HitTestBehavior.opaque,
    onPanStart: game.onPanStart,
    onPanUpdate: game.onPanUpdate,
    onPanEnd: game.onPanEnd,
    child: game.widget,
  ), */
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    double controlsY = MediaQuery.of(context).size.height;
    print(controlsY);
    double controlsX = MediaQuery.of(context).size.width;
    print(controlsX);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          //Robots Vision Layer
          game.widget,
          //Robots Controls Layer
          Column(
            children: [
              SizedBox(height: 150),
              Row(
                children: [
                  SizedBox(width: 75),
                  Transform.translate(
                    offset: Offset(10, 57),
                    child: Joystick(
                      onChange: (Offset delta) => game.angularVelChange(delta),
                    ),
                  ),
                  Spacer(),
                  Transform.translate(
                    offset: Offset(20, 0),
                    child: MySlider(
                      onChange: (Offset delta) => game.linearVelChange(delta),
                    ),
                  ),
                  SizedBox(width: 100),
                ],
              ),
              SizedBox(height: 24),
            ],
          ),
        ],
      ),
    );
  }
}
