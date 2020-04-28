import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GridMenu extends StatelessWidget {
  final String title;
  final Icon gridMenuIcon;
  final Color color;
  final Widget screenName;
  final BorderRadiusGeometry border;
  GridMenu(
      {this.title,
      this.gridMenuIcon,
      this.screenName,
      this.border,
      this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screenName));
      },
      child: Card(
        elevation: 4,
        child: Center(
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: gridMenuIcon,
          ),
        ),
        color: color,
        //Colors.yellow[800],
        shape: RoundedRectangleBorder(
            borderRadius:
                border /* BorderRadius.only(
            bottomRight: Radius.circular(20),
          ),*/
            ),
      ),
    );
  }
}
