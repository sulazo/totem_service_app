import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:totem_service_app/models/applicant.dart';
import 'package:totem_service_app/ui_screens/DashboardScreen.dart';
import 'package:totem_service_app/widgets/signature_pad.dart';
import 'dart:ui' as ui;

//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// ignore: camel_case_types
class MaintenanceReport extends StatefulWidget {
  static const String id = "MaintenanceReport";
  @override
  _MaintenanceReportState createState() => _MaintenanceReportState();
}

// ignore: camel_case_types
class _MaintenanceReportState extends State<MaintenanceReport> {
  GlobalKey _globalKey;
  final applicant = Applicant();
  bool loading = false;
  final storageReference = FirebaseStorage.instance.ref();
  /* firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;*/

/*  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instanceFor(
          bucket: 'secondary-storage-bucket');*/

  void convertImageToWidget() async {
    RenderRepaintBoundary renderRepaintBoundary =
        _globalKey.currentContext.findRenderObject();
    ui.Image boxImage = await renderRepaintBoundary.toImage(pixelRatio: 1);
    ByteData byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uInt8list = byteData.buffer.asUint8List();
    setState(() {
      loading = true;
    });

    storageReference
        .child("IMG ${DateTime.now().millisecondsSinceEpoch}")
        .putData(uInt8list);
    //await uploadTask.onComplete;

    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is removed from the widget tree
    _nameTextController.dispose();
    _phoneNumberTextController.dispose();
    _emailTextController.dispose();
    _descriptionTextController.dispose();
    _officeTextController.dispose();
    super.dispose();
  }

  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _phoneNumberTextController = TextEditingController();
  TextEditingController _descriptionTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _officeTextController = TextEditingController();

  /* void processApplicant() {
    try {
      applicant.processApplication();
      // applicant.processApplication();
    } catch (e) {}
  }*/

//  final _formKey = GlobalKey<FormState>();

  String _validateName(String value) {
    //    _formWasEdited = true;
    if (value.isEmpty) return 'Enter name';
    if (value.length < 8) return '8 or more characters';
    return null;
  }

  Widget rowSpacer = Container(
    height: 10.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white10,
      /*Color(0xff153a54)*/
      appBar: AppBar(
        backgroundColor: Color(0xff153a54),

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardScreen(),
            ),
          ),
        ),
        //  backgroundColor: Color(0xff153a54),
        centerTitle: true,
        title: Text("Maintenance Report"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RepaintBoundary(
                key: _globalKey,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                          /* DateFieldWidget(
                              // onXaved: () {},
                              ),*/
                          TextFormField(
                            controller: _nameTextController,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                            decoration: InputDecoration(
                              icon: Icon(Icons.person),
                              labelText: "Engineer Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      new Radius.circular(2.0))),
                            ),
                            onSaved: (String value) {
                              applicant.name = value;
                            },
                            validator: _validateName,
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(35),
                            ],
                          ),
                          rowSpacer,
                          TextFormField(
                            onSaved: (String newValue) {
                              applicant.description = newValue;
                            },
                            controller: _descriptionTextController,
                            maxLines: 5,
                            validator: (String text) {
                              if (text.length < 10)
                                return " Enter full description of issue";
                              else
                                return null;
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.description),
                              //prefixText: "Description of work order requested",
                              labelText: "Description of service request",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  new Radius.circular(2.0),
                                ),
                              ),
                            ),
                          ),
                          //  rowSpacer,
                          rowSpacer,
                          SignaturePad(),
                          rowSpacer,
                          Container(
                            margin: EdgeInsets.only(left: 35),
                            decoration: BoxDecoration(border: Border.all()),
                            child: Text(
                                "This legal disclaimer:Your use of the site site [and our mobile application] is solely at your own risk."
                                " This disclaimer was created using Termly’s disclaimer generator."),
                          ),
                        ]),
                  ),
                ),
              ),
              RaisedButton(
                  child: Text('Submit'),
                  color: Colors.green,
                  onPressed: () {
                    convertImageToWidget();
                    /*  if (_formKey.currentState.validate()) {
                      // The save method saves the form so you can access the fields.
                   //   _formKey.currentState.save();
                      //applicant.saveApplicant();
                      //processApplicant();


                      Alert(
                        context: context,
                        type: AlertType.info,
                        title: "TotemTra Field Service Application",
                        desc: "Your request has been submitted.😃",
                        buttons: [
                          DialogButton(
                            color: Colors.blue,

                            child: Text(
                              "Complete",
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () =>
                                Navigator.pushNamed(context, LandingPage.id),
                            //  color: Colors.redAccent[100],
                            radius: BorderRadius.circular(0.0),
                          ),
                        ],
                      ).show();
                    }*/
                    // setState(() {});
                  }),
              // SizedBox(width: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
