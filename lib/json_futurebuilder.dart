import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

//var decodedJsonData;
void main() async {
  List data = await getJson();

  // List decodedJsonData= await getQuakes();
  //  print(decodedJsonData);

  runApp(MaterialApp(
    title: "Quakes",
    home: Quakes(),
  ));
}

class Quakes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Quakes"),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
            future: getJson(),
            builder: (BuildContext context, AsyncSnapshot snapShot) {
              if (snapShot.data == null || !snapShot.hasData) {
                return Container(
                  child: Center(
                    child: Text("Loading......"),
                  ),
                );
              } else
                return ListView.builder(
                    itemCount: snapShot.data.length,
                    itemBuilder: (BuildContext context, int position) {
                      return ListTile(
                          trailing: Icon(Icons.play_circle_filled),
                          subtitle: Text(
                              'Email : ${snapShot.data[position]["email"]}'),
                          title: Text(
                              "User name :  ${snapShot.data[position]["name"]}"),
                          leading: CircleAvatar(
                              //radius: 15,
                              backgroundColor: Colors.redAccent,
                              child: Text(
                                  snapShot.data[position]["id"].toString())),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    DetailsScreen(
                                      user: snapShot.data[position]["name"],
                                      email: snapShot.data[position]["email"],
                                    )));
                          });
                    });
            }),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String user;
  final String email;

  DetailsScreen({this.user, this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(user),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text(user), Text(email)]),
      ),
    );
  }
}

Future<List> getJson() async {
  final dataFromJsonServer =
      await http.get("https://jsonplaceholder.typicode.com/users");
  final decodedJsonData = json.decode(dataFromJsonServer.body);
  //print(decodedJsonData);

  return decodedJsonData;
}
