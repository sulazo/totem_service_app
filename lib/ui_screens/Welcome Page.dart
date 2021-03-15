import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Landing Page.dart';
import 'customWidget1.dart';
import 'package:firebase_core/firebase_core.dart';

//TODO: Add animated_text_kit 3.1.0 to animate Totem_tra Field Service App Mobile App

class LogInPage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Colors.red.withOpacity(controller.value), //animation.value, Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              //"${controller.value.toInt()} %",
              'Totemtra Field Service \n Application',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35.0,
                color: Colors.blue,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            RaisedButtonWidget(
              label: "Sign In",
              onPressd: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LandingPage()));
              },
              kolor: Colors.blue,
            ),
            RaisedButtonWidget(
              label: "Register ",
              onPressd: () {
                //   Navigator.pushNamed(context, RegistrationScreen.id);
              },
              kolor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}

/**/
