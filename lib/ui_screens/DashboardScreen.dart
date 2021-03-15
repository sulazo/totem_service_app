import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:totem_service_app/ui_screens/Company%20Profile.dart';
import 'package:totem_service_app/ui_screens/Service Request Screen.dart';
//import 'package:totem_service_app/ui_screens/Welcome%20Page.dart';
import 'package:totem_service_app/ui_screens/Maintenence Report Screen.dart';
import 'package:totem_service_app/widgets/grid_menu.dart';
import 'Ecapture mtce  Screen.dart';
import 'LogIn Screen.dart';
import 'Redirect.dart';

class LandingPage extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static const String id = "LandingPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, CompanyProfilePage.id);
          },
          child: Icon(FontAwesomeIcons.info),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                  _firebaseAuth.signOut();
                  Navigator.pushNamed(context, LoginScreen.id);

                  //Implement logout functionality
                }),
          ],

          centerTitle: true,
          leading: Icon(Icons.business),
          backgroundColor: Colors.lightBlue, //Color(0xffDE4F07),
          //Color(0xff1d1e33), Color(0xff153a54),
          title: Text(
            "Totem_Tra FSA",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xffe6ebee),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 200,
                    child: Image.asset(
                      "images/pix.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  GridView.count(
                      // childAspectRatio: 0.98,
                      crossAxisCount: 2,
                      primary: false,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                      shrinkWrap: true,
                      children: <Widget>[
                        GridMenu(
                          gridMenuIcon: Icon(
                            FontAwesomeIcons.servicestack,
                            color: Colors.white,
                            size: 50,
                          ),
                          border: BorderRadius.circular(10),
                          title: "Service Request",
                          color: Colors.yellow[800],
                          screenName: ServiceRequestScreen(),
                        ),
                        GridMenu(
                          gridMenuIcon: Icon(
                            FontAwesomeIcons.briefcase,
                            color: Colors.white,
                            size: 50,
                          ),
                          border: BorderRadius.circular(10),
                          title: "Work Order Report",
                          color: Colors.pink,
                          screenName: WorkOrderForm(),
                        ),
                        GridMenu(
                          gridMenuIcon: Icon(
                            FontAwesomeIcons.cogs,
                            color: Colors.white,
                            size: 50,
                          ),
                          border: BorderRadius.circular(10),
                          title: "Support",
                          color: Colors.deepOrangeAccent,
                          screenName: RedirectPage(),
                        ),
                        GridMenu(
                          gridMenuIcon: Icon(
                            FontAwesomeIcons.dochub,
                            color: Colors.white,
                            size: 50,
                          ),
                          border: BorderRadius.circular(10),
                          title: "e-docs",
                          color: Colors.purple,
                          screenName:
                              ElectronicWorkOrder(), //MaintenanceReport(),
                        ),
                      ]),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        // height: 199,
                        color: Colors.lightBlue, //Color(0xff153a54),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
