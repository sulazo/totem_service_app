import 'package:flutter/material.dart';
import 'dart:async';

import 'Landing Page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LandingPage(),
              // LandingPage(),

              //LoginPage(),//HomePage(),   // AppBar1(),  //  MainCollapsingToolbar ()  //
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment:Alignment.center ,

        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Color(
                0xff153a54), //Color(0xff923403)             //Color(0xff5032b6),Color(0xffdd4f05)
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // SizedBox(height: 150),
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            "images/globe.png",
                          ),
                          // child: Icon(Icons.account_balance,size: 50,),
                          radius: 60,
                          //backgroundImage: ,
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(height: 20),

                        Text(
                          "TOTEM_TRA GLOBAL SERVICES",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),

                        Text(
                          " We promise to deliver exceptional services \n to all our customers!😃",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.white),
                        ),
                      ],
                    )),
                SizedBox(height: 20),
                Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment(0, 0),
                        child: Column(children: <Widget>[
                          SizedBox(width: 5),
                          CircularProgressIndicator(
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.white),
                            strokeWidth: 5,
                            //backgroundColor: Colors.white ,
                          ),
                        ])))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
