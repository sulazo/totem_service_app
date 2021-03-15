import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:totem_service_app/ui_screens/Landing%20Page.dart';
import 'package:totem_service_app/widgets/constants.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "RegistrationScreen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String userEmail;
  // String userName;
  String userPassword;
  bool showProgressIndicator = false;

  //TODO:use valiadtor or AlertDialogue

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightBlue,
      body: ModalProgressHUD(
        inAsyncCall: showProgressIndicator,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: "logo",
                child: Container(
                  height: 70.0,
                  child: Image.asset("images/totemlogo.png"),
                ),
              ),
              SizedBox(
                height: 38.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (inputValue) {
                  userEmail = inputValue;
                  //Do something with the user input.
                },
                decoration: kBoxDecoration.copyWith(hintText: "Enter email"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (inputValue) {
                  userPassword = inputValue;
                  //Do something with the user input.
                },
                decoration:
                    kBoxDecoration.copyWith(hintText: "Enter password here 👇"),
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      //  setState(() {
                      showProgressIndicator = true;
                      //   });
                      try {
                        // UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword
                        final user = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: userEmail, password: userPassword);
                        if (user != null) {
                          print(user);
                          Navigator.pushNamed(context, LandingPage.id);
                        }
                        showProgressIndicator = false;

                        /* setState(() {
        showProgressIndicator = false;
      });*/

                      } catch (e) {
                        print(e);
                      } finally {
                        setState(() {
                          showProgressIndicator = false;
                        });
                      }

                      //Implement registration functionality.
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  createNewUser() async {}
}
