import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:totem_service_app/models/applicant.dart';
//import 'package:totem_service_app/widgets/number_formatter.dart';
import 'Landing Page.dart';
//import 'Totem tra Logo.dart';

// Define a Custom Form Widget
class ServiceRequestScreen extends StatefulWidget {
  @override
  _ServiceRequestScreenState createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> {
  Applicant applicant = Applicant();

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

  void processApplicant() async {
    try {
      // await applicant.processApplication();
      applicant.processApplication();
    } catch (e) {}
  }

  final _formKey = GlobalKey<FormState>();

/*  final UsPhoneTextInputFormatter _phoneNumberFormatter =
      UsPhoneTextInputFormatter();*/

  String _validateName(String value) {
    //    _formWasEdited = true;
    if (value.isEmpty) return 'Enter name';
    if (value.length < 8) return '8 or more characters';
    return null;
  }

  String _validatePhoneNumber(String value) {
    if (value.isEmpty) return 'Enter phone number';
    if (value.length < 11) return 'Enter 11 digits phone number';

    //if (value.length < 8) return '8 or more characters';
    //    _formWasEdited = true;
    // final RegExp phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    //if (!phoneExp.hasMatch(value)) return '11 digits phone #';
    return null;
  }

  String _validateEmail(String value) {
    //    _formWasEdited = true;
    if (value.isEmpty) return 'Enter email address';
    if (value.length < 8) return '8 or more characters';
    if (!value.contains('@')) return 'Missing @';
    return null;
  }

  Widget rowSpacer = Container(
    height: 8.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff153a54),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LandingPage(),
            ),
          ),
        ),
        backgroundColor: Color(0xff153a54),
        centerTitle: true,
        title: Text("Service Request Form"),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _nameTextController,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),

                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(new Radius.circular(2.0))),
                      ),
                      onSaved: (String value) {
                        applicant.name = value;
                      },
                      validator: _validateName,
                      // TextInputFormatters are applied in sequence.
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(35),
                        WhitelistingTextInputFormatter(RegExp("[a-zA-Z ]")),
                      ],
                    ),
                    rowSpacer,
                    TextFormField(
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),

                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: "Email address",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(new Radius.circular(2.0))),
                      ),
                      keyboardType: TextInputType.emailAddress,

                      controller: _emailTextController,
                      onSaved: (String value) {
                        applicant.email = value;
                      },
                      validator: _validateEmail,
                      // TextInputFormatters are applied in sequence.
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(35),
                        WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9.@]")),
                      ],
                    ),
                    rowSpacer,
                    // TextFormField(),
                    //  Icon(Icons.phone),
                    TextFormField(
                      controller: _phoneNumberTextController,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),

                      decoration: InputDecoration(
                        icon: Icon(Icons.phone_android),
                        labelText: "Phone",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(new Radius.circular(2.0))),
                      ),
                      //  controller: _cellPhoneNumberTextController,
                      onSaved: (String value) {
                        applicant.phoneNumber = value;
                      },
                      validator: _validatePhoneNumber,
                      // TextInputFormatters are applied in sequence.
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(11),
                        WhitelistingTextInputFormatter.digitsOnly,
                        // Fit the validating format.
                        //  _phoneNumberFormatter,
                      ],
                    ),
                    rowSpacer,
                    TextFormField(
                      controller: _officeTextController,
                      onSaved: (val) => applicant.office = val,
                      validator: (input) =>
                          input.isEmpty ? " enter text here" : null,
                      // onChanged: ,
                      // maxLength: 50,
                      decoration: InputDecoration(
                        icon: Icon(Icons.business),
                        labelText: "Office",
                        // prefixText: "Office:",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(new Radius.circular(2.0))),
                      ),
                    ),

                    rowSpacer,
//                  Container(
//                    height: 100,

                    TextFormField(
                      controller: _descriptionTextController,
                      maxLines: 5,
                      validator: (String text) {
                        if (text.length < 10)
                          return " Enter full description of issue";
                        else
                          return null;
                      },
                      onSaved: (val) => applicant.description = val,
                      // setState(() => applicant.description = val),
                      decoration: InputDecoration(
                        icon: Icon(Icons.description),
                        //prefixText: "Description of work order requested",
                        labelText: "Description of service request",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(new Radius.circular(2.0))),
                      ),
                    ),

                    rowSpacer,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        RaisedButton(
                            child: Text('Submit'),
                            color: Colors.green,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                // The save method saves the form so you can access the fields.
                                _formKey.currentState.save();
                                //   applicant.saveApplicant();
                                processApplicant();
                                Alert(
                                  context: context,
                                  type: AlertType.info,
                                  title: "TotemTra  Field Service  App",
                                  desc: "Your request has been submitted.😃",
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
                                      //  color: Colors.redAccent[100],
                                      radius: BorderRadius.circular(0.0),
                                    ),
                                  ],
                                ).show();
                              }
                              // setState(() {});
                            }),
                        SizedBox(width: 10.0),
                        RaisedButton(
                            child: Text('Reset'),
                            color: Colors.red,
                            onPressed: () {
                              _nameTextController.text = '';
                              _phoneNumberTextController.text = '';
                              _emailTextController.text = '';
                              _descriptionTextController.text = "";
                              _officeTextController.text = "";

                              // applicant.licenseImageFile = null;
                              // setState(() {});
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
