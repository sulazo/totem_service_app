import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:totem_service_app/models/service.dart';

class ServiceOrderForm extends StatefulWidget {
  @override
  _ServiceOrderFormState createState() => _ServiceOrderFormState();
}

class _ServiceOrderFormState extends State<ServiceOrderForm> {
  ServiceForm serviceForm = ServiceForm();

  TextEditingController _nameTextController = TextEditingController();
  //TextEditingController _emailTextController = TextEditingController();
  //TextEditingController _descriptionTextController = TextEditingController();

  // TextEditingController _nameTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding:false
      appBar: AppBar(
        backgroundColor: Color(0xffdd4f05),
//        actions: <Widget>[
//          Icon(Icons.send),
//        ],
        centerTitle: true,
        title: Text("Maintenance Request Form"),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          Form(
          //  autovalidate: true,
            key: _formKey,
            child: Container(
              child: Column(
                children: <Widget>[
                  Text("DIGITAL REGISCOPE SYSTEM ",
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),

                 SizedBox(height: 25),

                  TextFormField(
                  //  inputFormatters: ,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple
                  ),
                  //  controller: _nameTextController,
                    keyboardType: TextInputType.text,
                    onSaved: (String value) {
                      setState(() {
                        serviceForm.name = value;
                      });

                    },
                    validator: (String value) {
                      if (value.isEmpty) return 'Enter name';
                      if (value.length < 8) return '8 or more characters';
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      // prefixText:"Prefixtext" ,
                      // helperText: "Helper TExt",
                      // alignLabelWithHint: true,
                      // prefixText: "Name:",
                      labelText: "Requester Name",
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(new Radius.circular(2.0))),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    validator: _validateEmail,
                    onSaved: (inputValue) => setState(() => serviceForm.email = inputValue),
                    keyboardType: TextInputType.emailAddress,
                    // maxLength: 50,
                    decoration: InputDecoration(
                      labelText: "Email",

                      // prefixText: "Email:",
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(new Radius.circular(2.0))),
                    ),
                  ),
                  SizedBox(height: 25),
                  _buildRow(),

                  SizedBox(height: 25),

                  TextFormField(
                    onSaved: (val) => setState(() =>serviceForm.office = val),
                    validator: (input)=> input.isEmpty ? " enter text here" : null,
                    // onChanged: ,
                    // maxLength: 50,
                    decoration: InputDecoration(
                      labelText: "Department",
                      // prefixText: "Office:",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(new Radius.circular(2.0))),
                    ),
                  ),

                  SizedBox(height:25),
//                  Container(
//                    height: 100,

                  TextFormField(
                    maxLines: 5,
                    validator: (String text) {
                      if (text.length < 10)
                        return " Enter full description of issue";
                      else
                        return null;
                    },

                      onSaved: (val) => setState(() => serviceForm.description =val),




                    decoration: InputDecoration(
                      //prefixText: "Description of work order requested",
                      labelText: "Description of work order requested",
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(new Radius.circular(2.0))),
                    ),
                  ),
                  //
                  SizedBox(height: 20),
                  RaisedButton(
                      color: Color(0xff923403),//Color(0xff5032b6),
                      child: Text("Submit Request",
                          textScaleFactor: 1,
                          style: TextStyle(color: Colors.white)),
                       onPressed: () {
                       final form = _formKey.currentState;

                       if (form.validate()) {
                         form.save();
                         print('Description : ${serviceForm.description}');
                         print(serviceForm.name);
                         print(serviceForm.email);

                         // Form is saved, perform the login now.
                       }
                        serviceForm.processApplication();
                       Navigator.pop(context);

                      }


                      )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildRow() {
    return Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: TextFormField(
           validator: _validateDate,
          onSaved: (val) => setState(() =>serviceForm.date= val),
             keyboardType: TextInputType.datetime,
            //maxLength: 50,
            decoration: InputDecoration(
              hintText: ('dd/mm/yyyy'),

              labelText: "Date",
              //  prefixText: "ID:",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(new Radius.circular(2.0))),
            ),
          ),
        ),
        SizedBox(width: 10),
        Flexible(
           //flex: 2,
          child: TextFormField(
            keyboardType: TextInputType.numberWithOptions(),
            validator: validateMobile,
            onSaved: (val) => setState(() =>serviceForm.phoneNumber = val),
            //onSaved: ,
            // maxLength: 50,
            decoration: InputDecoration(
              labelText: "Phone Number",
              // prefixText: "Email:",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(new Radius.circular(2.0))),
            ),
          ),
        )
      ],
    );
  }



  String _validateEmail(String value) {
//    _formWasEdited = true;
    if (value.isEmpty) return 'Enter email address';
    if (value.length < 8) return '8 or more characters';
    if (!value.contains('@')) return 'Missing @';
    return null;
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length < 12)
      return '12 digits Mobile Number ';
    else
      return null;
  }

   String _validateDate(String value) {
    if (value.length ==null)
      return "Enter date";
//    _formWasEdited = true;
//    final RegExp dateExp = RegExp(r'\d\d\/\d\d\/\d\d\d\d$');
   /* final RegExp dateExp =
    RegExp(r'^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$');
    if (!dateExp.hasMatch(value)) return 'mmddyyyy';*/
   else
    return null;
  }

//String validateEmail(String value) {
//  Pattern pattern =
//      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//  RegExp regex = new RegExp(pattern);
//  if (!regex.hasMatch(value))
//    return 'Enter Valid Email';
//  else
//    return null;
//}


//void processApplication() async {
//  var mailBody = """
//      <html>
//      <h1>Rental Application</h1>
//      <br>
//      <p><b>Name:<b> $name</p>
//      <p><b>Cell phone:<b> $cellPhoneNumber</p>
//      <p><b>Work phone:<b> $workPhoneNumber</p>
//      <p><b>Birthday:<b> $birthday</p>
//      <p><b>email:<b> $email</p>
//      <p><b>Social Security Number<b> shouldn't be emailed.</p>
//      <p><b>Address</p>
//      <p>$street</p>
//      <p>$city, $state $zip</p>
//      </html>""";
//
//  final MailOptions mailOptions = MailOptions(
//    body: mailBody,
//    subject: 'Rental Application for $name',
//    recipients: ['nobody@gmail.com'],
//    isHTML: true,
//    bccRecipients: [''],
//    ccRecipients: [''],
//
//  );
//
//  await FlutterMailer.send(mailOptions);
//}
}