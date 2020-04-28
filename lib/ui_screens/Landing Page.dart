import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
//import 'package:totem_service_app/ui_screens/Redirect.dart';
import 'package:totem_service_app/ui_screens/Service Request Screen.dart';
import 'package:totem_service_app/ui_screens/Work Order Report Screen.dart';
import 'package:totem_service_app/widgets/grid_menu.dart';
//import 'package:totem_service_app/ui_screens/Maintenance Report Screen.dart';

import 'Company Profile.dart';
//import 'Manuals List.dart';
import 'PdfViewerDoc1.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomPadding: true,
        // resizeToAvoidBottomInset: false,

        appBar: AppBar(
            centerTitle: true,
            // actions: <Widget>[Icon(FontAwesomeIcons.)],
            leading: Icon(Icons.business),
            backgroundColor: Color(0xff153a54),
            //Color(0xff1d1e33),
            title: Text(
              "Totemtra Field Service Application",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        backgroundColor: Color(0xffe6ebee),
        //  resizeToAvoidBottomPadding:false,

        body: SafeArea(
          child: ListView(children: <Widget>[
            Container(
              height: 180,
              // MediaQuery.of(context).size.height * 0.26,
              child: Image.asset(
                "images/pix.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              // padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                  crossAxisCount: 2,
                  primary: false,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                  shrinkWrap: true,
                  children: <Widget>[
                    GridMenu(
                      gridMenuIcon: Icon(
                        FontAwesomeIcons.servicestack,
                        size: 30,
                      ),
                      border:
                          BorderRadius.only(bottomRight: Radius.circular(20)),
                      title: "Service Request",
                      color: Colors.yellow[800],
                      screenName: ServiceRequestScreen(),
                    ),
                    GridMenu(
                      gridMenuIcon: Icon(
                        FontAwesomeIcons.briefcase,
                        size: 30,
                      ),
                      border:
                          BorderRadius.only(bottomLeft: Radius.circular(20)),
                      title: "Work Order Report",
                      color: Colors.pink,
                      screenName: WorkOrderForm(),
                    ),
                    GridMenu(
                      gridMenuIcon: Icon(
                        FontAwesomeIcons.cogs,
                        size: 30,
                      ),
                      border: BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                      title: "Support",
                      color: Colors.lightBlue,
                      screenName: PdfViewerDoc1(),
                    ),
                    GridMenu(
                      gridMenuIcon: Icon(
                        FontAwesomeIcons.infoCircle,
                        size: 30,
                      ),
                      border: BorderRadius.only(
                        topLeft: Radius.circular(20),
                      ),
                      title: "About",
                      color: Colors.deepPurple,
                      screenName: CompanyProfilePage(),
                    ),
                  ]),
            )
          ]),
        ));
  }
}
