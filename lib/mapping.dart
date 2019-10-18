import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      title: "Sample1",
    ));

class Home extends StatefulWidget {
  // final items= List<String>.generate(10, (i)=>"items$i");
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final listOfItems = List<String>.generate(100, (index) {
    return "item number $index";
  });

  List<String > cities =["Agege" ,"Benin" ,"Calabar","Epe","Ikeja"," Agege","Jimeta","Ibadan","Jos",'Kaduna'
      " Paris","Mumbai","Ausburg","Boston",'Hartford','Lokoja',
  "Imo",'Owerri',"Gusau"," Ibadan","Badagri","Alimosho"," Jos","Springfield","Houston","Bloomfield"];
  //final cities;
 //final listOfCities= cities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[Icon(Icons.picture_as_pdf)],
        title: Text("Experimental"),
      ),
      body: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, position) {
            //return Text("${listOfItems [position]}");
            return ListTile(
             // title: Text("${listOfItems[position]}"),
              //sub
              leading:Icon(Icons.location_city),
                title:

                    Text("${cities[position]}")
            );
          }),
    );
  }
}
