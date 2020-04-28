/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Doc1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("User Manual"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('trips').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: Text("Loading..."));
            //LinearProgressIndicator();
            else
              return Container(
                //  height: 115.5,
                // width: MediaQuery.of(context).size.width / 2 - 72.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        snapshot.data.documents[0].data['images'][0]),
                  ),
                ),
              );
          }),
    );
  }
}*/
