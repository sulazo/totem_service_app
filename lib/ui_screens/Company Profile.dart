import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xff153a54),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 100, right: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 350.0,
                    child: SizedBox(
                      width: 250.0,
                      child: TypewriterAnimatedTextKit(
                          onTap: () {
                            print("Tap Event");
                          },
                          text: ["Totem_Tra Software Solutions"],
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontFamily: "Faster one"),
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional
                              .topStart // or Alignment.topLeft
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "PRO 03.29.2020,",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
