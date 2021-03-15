import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:totem_service_app/models/Work%20Order%20Form%20Model.dart';
import 'package:totem_service_app/widgets/constants.dart';
import 'package:totem_service_app/widgets/dateWorkform.dart';
import 'DashboardScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkOrderForm extends StatefulWidget {
  static const String id = "MaintenanceReport";
  final DateTime initialDateTime = DateTime.now();

  @override
  _WorkOrderFormState createState() => _WorkOrderFormState();
}

class _WorkOrderFormState extends State<WorkOrderForm> {
  // TextEditingController _dateEditingController = TextEditingController();
  TextEditingController _officeEditingController = TextEditingController();
  TextEditingController _engineersEditingController = TextEditingController();

  String _validateOffice(String value) {
//    _formWasEdited = true;
    if (value.isEmpty) return 'Name of Office';
    if (value.length < 1) return 'Enter full name of office';
    return null;
  }

  String _validateEngineersName(String value) {
//    _formWasEdited = true;
    if (value.isEmpty) return 'Enter name';
    if (value.length < 4) return 'Enter full name ';
    return null;
  }

/*  String _validateDate(String value) {
//    _formWasEdited = true;
    final RegExp dateExp = RegExp(
        r'^(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$');
    // final RegExp dateExp = RegExp(
    //RegExp(r'^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$');
    if (!dateExp.hasMatch(value)) return 'mm/ddd/yyyy';
    return null;
  }*/

  // Applicant applicant = Applicant();
  WorkForm workForm = WorkForm();
  //Future<String> loadApplicant;

  final _workOrderformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      //: Color(0xff153a54),
      //resizeToAvoidBottomPadding:false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple, // Color(0xffDE4F07),
        centerTitle: true,
        title: Text("Maintenance Report"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _workOrderformKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            border: Border.all(width: 0),
                          ),
                          child: DateWidget(workForm: workForm),
                        ),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: TextFormField(
                          validator: _validateOffice,
                          // TextInputFormatters are applied in sequence.
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(15),
                            /* WhitelistingTextInputFormatter(
                                RegExp("[0-9a-zA-Z ]")),*/
                          ],

                          controller: _officeEditingController,
                          onSaved: (newValue) {
                            workForm.office = newValue;
                          },
                          // maxLength: 50,
                          decoration: InputDecoration(
                            labelText: "Office",
                            // prefixText: "Office:",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(new Radius.circular(2.0))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // _buildRow2(label1: "Date", label2: "Branch"),
                  SizedBox(height: 8),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // SizedBox(width: 10),
                      Flexible(
                        child: TextFormField(
                          validator: _validateEngineersName,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(35),
                            /* WhitelistingTextInputFormatter(
                                RegExp("[0-9a-zA-Z ]")),*/
                          ],
                          controller: _engineersEditingController,
                          onSaved: (value) {
                            workForm.engineersName = value;
                          },
                          // maxLength: 50,
                          decoration: InputDecoration(
                            labelText: "Engineer's Name",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(new Radius.circular(2.0))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        workForm.imageFile == null
                            ? Container(
                                child: Image.asset(
                                  "images/placeholder.jpg",
                                  fit: BoxFit.cover,
                                ),
                                // width: 340,

                                height: 350.h,
                                //color: Colors.white,
                              )

                            //Text('No document captured.')
                            : Image.file(
                                workForm.imageFile,
                                fit: BoxFit.cover,
                                height: 350.h,
                                // width: 340.0 //consider adding fit
                              ),
                        RaisedButton(
                            // color: Colors.,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.camera,
                                  color: Colors.white,
                                ),
                                Text(
                                  "  Capture Document ",
                                  style: kSubtitleTextDecoration,
                                ),
                              ],
                            ),
                            // title: 'Capture License',
                            color: Colors.deepPurple, //Color(0xffDE4F07),
                            onPressed: () {
                              getImage();
                              // setState(() {});
                            }),
                        RaisedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.share,
                                  color: Colors.white,
                                ),
                                Text(
                                  '  Submit',
                                  style: kSubtitleTextDecoration,
                                ),
                              ],
                            ),
                            color: Colors.deepPurple, //Color(0xffDE4F07),
                            onPressed: () {
                              if (_workOrderformKey.currentState.validate()) {
                                // The save method saves the form so you can access the fields.
                                _workOrderformKey.currentState.save();
                                processApplicant();
                                Alert(
                                  context: context,
                                  type: AlertType.info,
                                  title: "TotemTra  Field Service  App",
                                  desc:
                                      "Your application has been submitted.😃",
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "Complete",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DashboardScreen()));
                                      },
                                      color: Colors.purple,
                                      radius: BorderRadius.circular(0.0),
                                    ),
                                  ],
                                ).show();
                              }
                              // setState(() {});
                            }),
                      ]),

                  //  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    final image = await ImagePicker().getImage(
      source: ImageSource.camera,
      imageQuality: 100,
    );

    setState(() {
      // cropped = image;
      // workForm.licenseImageFile = cropped;
      workForm.imageFile =
          File(image.path); // i need  to understand this better
      print(" *****This is the path to the captured form = " + image.path);
      // _inCroppingProcess = false;
    });
  }

  void processApplicant() {
    try {
      //await applicant.processApplication();
      workForm.processApplication();
    } catch (e) {
      print(e);
    }
  }
}
