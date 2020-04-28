/*
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_set/widget/transition_animations.dart';

class RedirectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimatorSetState();
  }
}

class AnimatorSetState extends State<RedirectPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xff153a54),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          TypewriterAnimatedTextKit(
              onTap: () {
                print("Tap Event"); // tap and proceed to next screen
              },
              text: ["Access denied! \n Proceed to next screen"],
              textStyle: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20.0,
                  fontFamily: "Faster one"),
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ),
          */
/*  Text(
            "Access denied! \nProceed to next screen",
            style: TextStyle(
                color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
          ),*/ /*

          Center(
            child: Container(
                child: BoxColor(child: YYCubeGrid(), color: Color(0xff153a54))),
          ),
        ],
      ),
    ));
  }
}

class BoxColor extends StatefulWidget {
  BoxColor({this.child, this.color = Colors.black});

  final child;
  final color;

  @override
  State<StatefulWidget> createState() {
    return BoxColorState();
  }
}

class BoxColorState extends State<BoxColor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 600,
      // width: 500,
      padding: EdgeInsets.all(60),
      child: widget.child,
      color: widget.color,
    );
  }
}
*/
