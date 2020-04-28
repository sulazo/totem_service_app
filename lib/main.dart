import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:scc_app/UI/Splash%20Screen.dart';
//import 'package:scc_app/UI/labwidgets/appbarSample1.dart';
//import 'package:scc_app/UI/sliverAppbar.dart';
import 'package:totem_service_app/ui_screens/Splash Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  title: ,
      theme: ThemeData.dark(),
      /*ThemeData(
          primaryColor: Color(0xffdd3a51), accentColor: Colors.red[100]),*/
      home:
          SplashScreen(), //AppBar1(),       // MainCollapsingToolbar(),     //SplashScreen(),
    );
  }
}
