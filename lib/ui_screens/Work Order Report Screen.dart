import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:totem_service_app/models/Work%20Order%20Form%20Model.dart';
//import 'package:totem_service_app/widgets/number_formatter.dart';

//import 'Old_Home Page.dart';
import 'Landing Page.dart';

class WorkOrderForm extends StatefulWidget {
  @override
  _WorkOrderFormState createState() => _WorkOrderFormState();
}

class _WorkOrderFormState extends State<WorkOrderForm> {
  TextEditingController _dateEditingController = TextEditingController();
  TextEditingController _officeEditingController = TextEditingController();
  TextEditingController _engineersEditingController = TextEditingController();

  bool _inCroppingProcess = false;

/*  final UsDateTextInputFormatter _dateTextInputFormatter =
      UsDateTextInputFormatter();*/

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

  String _validateDate(String value) {
//    _formWasEdited = true;
//    final RegExp dateExp = RegExp(r'\d\d\/\d\d\/\d\d\d\d$');
    final RegExp dateExp =
        RegExp(r'^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$');
    if (!dateExp.hasMatch(value)) return 'mm/dd/yyyy';
    return null;
  }

  // Applicant applicant = Applicant();
  WorkForm workForm = WorkForm();
  Future<String> loadApplicant;

  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff153a54),
      //resizeToAvoidBottomPadding:false,
      appBar: AppBar(
        backgroundColor: Color(0xff153a54),
        centerTitle: true,
        title: Text("Maintenance Report"),
      ),
      body: Stack(children: <Widget>[
        SafeArea(
          child: ListView(
            children: <Widget>[
              Form(
                key: _formKey2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // SizedBox(width: 10),
                          Flexible(
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              inputFormatters: <TextInputFormatter>[
                                // _dateTextInputFormatter,
                                LengthLimitingTextInputFormatter(10),
                                // WhitelistingTextInputFormatter.digitsOnly,
                              ],

                              controller: _dateEditingController,
                              onSaved: (newValue) {
                                workForm.date = newValue;
                              },
                              validator: _validateDate,

                              // maxLength: 50,
                              decoration: InputDecoration(
                                hintText: 'dd/mm/yyyy',

                                labelText: "Date",
                                // prefixText: "Office:",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    new Radius.circular(2.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            child: TextFormField(
                              validator: _validateOffice,
                              // TextInputFormatters are applied in sequence.
                              inputFormatters: <TextInputFormatter>[
                                LengthLimitingTextInputFormatter(15),
                                WhitelistingTextInputFormatter(
                                    RegExp("[0-9a-zA-Z ]")),
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
                                    borderRadius: BorderRadius.all(
                                        new Radius.circular(2.0))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // _buildRow2(label1: "Date", label2: "Branch"),
                      SizedBox(height: 10),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // SizedBox(width: 10),
                          Flexible(
                            child: TextFormField(
                              validator: _validateEngineersName,
                              inputFormatters: <TextInputFormatter>[
                                LengthLimitingTextInputFormatter(35),
                                WhitelistingTextInputFormatter(
                                    RegExp("[0-9a-zA-Z ]")),
                              ],
                              controller: _engineersEditingController,
                              onSaved: (value) {
                                workForm.engineersName = value;
                              },
                              // maxLength: 50,
                              decoration: InputDecoration(
                                labelText: "Engineer's Name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        new Radius.circular(2.0))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            workForm.licenseImageFile == null
                                ? Container(
                                    child: Image.asset(
                                      "images/placeholder.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                    // width: 340,

                                    height: 250,
                                    //color: Colors.white,
                                  )

                                //Text('No document captured.')
                                : Image.file(
                                    workForm.licenseImageFile,
                                    fit: BoxFit.cover,
                                    height: 250.0,
                                    // width: 340.0 //consider adding fit
                                  ),
                            RaisedButton(
                                // color: Colors.,
                                child: Text("Capture Document"),
                                // title: 'Capture License',
                                //  color: Colors.lightBlueAccent,
                                onPressed: () {
                                  getImage();
                                  // setState(() {});
                                }),
                            RaisedButton(
                                child: Text('Submit'),
                                //color: Colors.lightBlueAccent,
                                onPressed: () {
                                  if (_formKey2.currentState.validate()) {
                                    // The save method saves the form so you can access the fields.
                                    _formKey2.currentState.save();
                                    workForm.saveApplicant();
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
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LandingPage())),
                                          color: Colors.redAccent,
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
            ],
          ),
        ),
        (_inCroppingProcess)
            ? Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.95,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Center()
      ]),
    );
  }

  Future getImage() async {
    setState(() {
      _inCroppingProcess = true;
    });
    var image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
    );
    var cropped = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxHeight: 700,
        maxWidth: 700,
        compressFormat: ImageCompressFormat.png,
        androidUiSettings: AndroidUiSettings(
          // toolbarColor: Colors.red,
          // toolbarTitle: ,
          statusBarColor: Colors.blue,
        ));

//    applicant.licenseImageFile = image;

    setState(() {
      cropped = image;
      workForm.licenseImageFile = cropped;
      _inCroppingProcess = false;
    });
  }

  void processApplicant() async {
    try {
//      await applicant.processApplication();
      workForm.processApplication();
    } catch (e) {
      print(e);
    }
  }
}
