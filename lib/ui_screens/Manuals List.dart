/*
import 'package:flutter/material.dart';
import 'PDF docs/doc1.dart';
import 'PdfViewerDoc1.dart';

class Manuals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("User Manaul"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: <Widget>[
          Expanded(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        //Doc1(),

                        PdfViewerDoc1(),
                  ),
                );
              },
              leading: Icon(Icons.note),
              title: Text("How to  Capture Images "),
              trailing: Text(">>"),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 5,
          ),
          Expanded(
            child: ListTile(
              onTap: () {},
              leading: Icon(Icons.note),
              title: Text("How To Shutdown Regiscope Safely"),
              trailing: Text(">>"),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 5,
          ),
          Expanded(
            child: ListTile(
              onTap: () {},
              leading: Icon(Icons.note),
              title: Text("How to Back up Data"),
              trailing: Text(">>"),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 5,
          ),
          Expanded(
            child: ListTile(
              onTap: () {},
              leading: Icon(Icons.note),
              title: Text("How to Create User Profile"),
              trailing: Text(">>"),
            ),
          ),
        ]),
      ),
    );
  }
}
*/
