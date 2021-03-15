import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkOrderList extends StatefulWidget {
  static const String id = "WorkOrderList";
  @override
  _WorkOrderListState createState() => _WorkOrderListState();
}

class _WorkOrderListState extends State<WorkOrderList> {
  String dateTimeStamp = DateFormat("dd-MM-yyyy").format(DateTime.now());

  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  String _validateText(String value) {
    if (value.isEmpty) return 'Enter more xters \n or   Close to exit';
    if (value.length <= 1) return 'Enter more characters';
    return null;
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  String input = "";

  final List<String> toDos = [
    "WO-013030860  BANK OF NIGERIA.",
    "WO-043030860  BANK OF LAGOS.",
    "WO-012953331  BANK OF DELTA.",
    "WO-013043225 BANK OF MIDDLETOWN."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Form(
              key: _formKey,
              child: TextFormField(
                autofocus: true,
                controller: _controller,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Enter task item',
                  errorStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                ),
                onChanged: (value) {
                  input = value;
                },
                validator: _validateText,
              ),
            ),
            actions: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.green,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            toDos.add(input);
                            _controller.text = "";
                            Navigator.pop(context);
                          });
                          // return;
                        } else
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    content: Text("Empty text"),
                                    actions: [
                                      Text(
                                        "☠️",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    ],
                                  ));

                        // Navigator.pop(context);
                      },
                      child: Text("Add to List"),
                    ),
                    SizedBox(
                      width: 20,
                    ), // button 1
                    RaisedButton(
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pop(context);
                        _controller.text = "";
                      },
                      child: Text("  Close   "),
                    ), // button 2
                  ])
              //
            ],
            title: Text("Add Todo List"),
          ),
        ),
        child: Icon(Icons.add_circle_sharp),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Work Orders",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, position) => Dismissible(
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                toDos.remove(
                    toDos[position]); //same as totDos.removeAt(position)
                if (direction == DismissDirection.endToStart) {
                  // dismissed to the left
                }
              },
              key: Key(toDos[position]),
              child: Card(
                // shadowColor: Colors.lightBlueAccent,
                color: Colors.blue, //Color(0xff70af85),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: ListTile(
                  title: Text(toDos[position]),
                  leading: Text(dateTimeStamp),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.delete_forever,
                        color: Colors.redAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          toDos.removeAt(position);
                        });
                      }),
                ),
              )),
          itemCount: toDos.length,
          // ite
        ),
      ),
    );
  }
}

/*
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class RedirectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimatorSetState();
  }
}

class AnimatorSetState extends State<RedirectPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xffdc00a5), // Color(0xff153a54),
          body: Stack(
            fit: StackFit.expand,
            children: [
              */
/* Image.asset(
                "images/subscription.jpg",
                fit: BoxFit.cover,
              ),*/ /*

              Center(
                child: Container(
                  //color: Colors.white,
                  child: Row(
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // SizedBox(width: 20.0, height: 100.0),

                      SizedBox(width: 20.0, height: 100.0),
                      RotateAnimatedTextKit(
                          duration: Duration(
                            seconds: 10,
                          ),
                          text: ["Available on subscription only"],
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 25.0,
                            color: Colors.white,
                            fontFamily: "Horizon",
                          ),
                          textAlign: TextAlign.start),
                    ],

                    */
/* child: Text(
                    "Available on subscription only",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 29,
                        fontWeight: FontWeight.w900),
                  ),*/ /*

                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class BoxColor extends StatefulWidget {
  BoxColor({this.child, this.color = Colors.black});

  final child;
  final color;

  @override
  State<StatefulWidget> createState() {
    return BoxColorState();
  }
}

class BoxColorState extends State<BoxColor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 600,
      // width: 500,
      padding: EdgeInsets.all(60),
      child: widget.child,
      color: widget.color,
    );
  }
}
*/
