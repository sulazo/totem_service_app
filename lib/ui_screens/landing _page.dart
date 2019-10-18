import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:totem_service_app/ui_screens/service_request_form.dart';
import 'package:totem_service_app/ui_screens/work_order_form.dart';

class Landing_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  resizeToAvoidBottomPadding:false,
        appBar: AppBar(
         // backgroundColor: Color(0xffdd4f05),
          title: Text("Totem Tra Global Services"),
          centerTitle: true,
        ),
        body: Container(
         // color:Color(0xffdd4f05),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //  margin: EdgeInsets.only(left: 10,right: 10,top:30),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Card(
                  //  color:Color(0xff923403)  ,
                  // border:BorderRadius.only(),
                   // shape: ,
                    elevation: 5,
                    // height: 100,

                    child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServiceOrderForm()));
                        },
                        title: Text("Service Request"),
                        // trailing: Text(">>"),
                        // subtitle: Text(" Click to select"),
                        leading: Icon(FontAwesomeIcons.servicestack)),
                  ),
                ),
             //   Divider(color: Colors.black),
                Expanded(
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkOrderForm())); // navigate to mtce report sheet
                      },
                      //trailing: Text(">>"),

                      title: Text("Work Orders"),
                      leading: Icon(FontAwesomeIcons.briefcase),
                    ),
                  ),
                  // height: 50,
                  // color: Colors.redAccent,
                ),
              //  Divider(color: Colors.black),
                Expanded(
                  child: Card(
                    elevation: 5,
                    // height: 100,
                    child: ListTile(
                      onTap: (){},
                        //    trailing: Text(">>"),
                        title: Text("Settings"),
                        leading: Icon(Icons.pages)),
                  ),
                  // height: 50,
                  // color: Colors.redAccent,
                ),
              //  Divider(color: Colors.black),
                Expanded(
                  child: Card(
                    elevation: 5,
                    // height: 100,
                    child: ListTile(
                        onTap: () {},
                        //   trailing: Text(">>"),
                        title: Text("Activities"),
                        leading: Icon(Icons.settings_applications)),
                  ),
                  // height: 50,
                  // color: Colors.redAccent,
                ),
               // Divider(color: Colors.black),
                Expanded(
                  child: Card(
                    elevation: 5,
                    // height: 100,
                    child: ListTile(
                        onTap: () {},
                        //  trailing: Text(">>"),
                        title: Text("About"),
                        leading: Icon(FontAwesomeIcons.infoCircle)),
                  ),
                  // height: 50,
                  // color: Colors.redAccent,
                ),
              ],
            )));
  }
}
