import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:totem_service_app/ui_screens/Landing%20Page.dart';
import 'package:totem_service_app/widgets/constants.dart';
import 'package:totem_service_app/widgets/passwordTextForm.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "LogInScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  String _validateEmail(String value) {
    //    _formWasEdited = true;
    if (value.isEmpty) return 'Enter email address';
    if (value.length < 8) return '8 or more characters';
    if (!value.contains('@')) return 'Missing @';
    return null;
  }

  String _validatePw(String value) {
    //    _formWasEdited = true;
    if (value.isEmpty) return 'Enter password';
    if (value.length < 1) return 'Password cant be empty';

    return null;
  }

  bool showIndicator = false;
  String password;
  String email;
  //FirebaseUser(). fb;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff153a54),
      body: ModalProgressHUD(
        inAsyncCall: showIndicator,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Container(
                    height: 150.0,
                    child: Image.asset("images/totemlogo.png"),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                TextFormFieldX(
                  controllerX: emailTextController,
                  obscure: false,
                  validatorX: _validateEmail,
                  hintX: 'Enter  email ',
                  onChangedX: (newValue) {
                    email = newValue;

                    //Do something with the user input.
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormFieldX(
                  controllerX: textController,
                  obscure: true,
                  validatorX: _validatePw,
                  hintX: "Enter password",
                  onChangedX: (newValue) {
                    password = newValue;
                  },
                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          //  });
                          logIn();
                        }

                        //Implement login functionality.
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Login',
                        style: kSubtitleTextDecoration,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void logIn() async {
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        showIndicator = true;
        Navigator.pushNamed(context, LandingPage.id);
        // emailTextController.clear();
        textController.clear();
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Column(children: [
                Text(
                  "Error message ",
                  style: TextStyle(color: Colors.red),
                ),
                Text(e.message),
              ]),
              actions: [
                FlatButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                )
              ],
            );
          });
      print("***Error message is " + e.message);
    } finally {
      setState(() {
        showIndicator = false;
      });
    }
  }
}
