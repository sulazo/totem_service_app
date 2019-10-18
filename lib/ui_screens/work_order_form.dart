import 'dart:typed_data';
import 'package:flutter/material.dart';
//import 'dart:async';
import 'package:signature/signature.dart';
//import 'package:screenshot_share_image/screenshot_share_image.dart';
//import 'package:totem_service_app/models/service.dart';
import 'package:totem_service_app/models/workOrder.dart';

class WorkOrderForm extends StatefulWidget {
  @override
  _WorkOrderFormState createState() => _WorkOrderFormState();
}

class _WorkOrderFormState extends State<WorkOrderForm> {
  //ByteData _img = ByteData(0);

  // ServiceForm serviceForm = ServiceForm();
  WorkForm workForm = WorkForm();

  final _formKey2 = GlobalKey<FormState>();

  // final _sign = GlobalKey<SignatureState>();
  var _signatureCanvas = Signature(
    height: 150,
    width: 400,
    backgroundColor: Colors.grey,
//    onChanged: (points) {
//      print(points);
//    },
  );

  @override
  Widget build(BuildContext context) {
//    print("am printing ...........");
//    final deviceHeight = MediaQuery.of(context).size.height;
//    final deviceWidth = MediaQuery.of(context).size.width;
//    print("device height $deviceHeight");
//    print("device width $deviceWidth");

    return Scaffold(
      //resizeToAvoidBottomPadding:false,
      appBar: AppBar(
        backgroundColor: Color(0xffdd4f05),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.send), onPressed: () => {})
          //ScreenshotShareImage.takeScreenshotShareImage()),
          // Icon(Icons.work),
        ],
        centerTitle: true,
        title: Text("Maintenance Form"),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey2,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 25, left: 10, right: 10, bottom: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                        //elevation: 10,
                        //color: Colors.grey,
                        child: Text(
                      "C.B.N MAINTENANCE REPORT",
                      style: TextStyle(fontSize: 18),
                    )),
                    SizedBox(height: 10),
                    _buildRow2(label1: "Date", label2: "Branch"),

                    //  SizedBox(height: 5),
                    /* TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        hintText: ('mm/dd/yyyy'),
                        labelText: "Date",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(new Radius.circular(2.0))),
                      ),
                    ),*/
                    SizedBox(height: 10),
                    TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(

                        alignLabelWithHint: true,
                        // prefixText: "Name:",
                        labelText: "Service Report",
                        border: OutlineInputBorder(
                            gapPadding: 3.3,
                            borderRadius:
                                BorderRadius.all(new Radius.circular(2.0))),
                      ),
                    ),

                    SizedBox(height: 10),
                    _buildRow1("Engineer's Name"),
                    SizedBox(height: 10),
                    TextFormField(
                      onSaved: (val) => setState(() => workForm.techName = val),
                      maxLines: 3,
                      decoration: InputDecoration(
                        // prefixText:"Prefixtext" ,
                        // helperText: "Helper TExt",
                        alignLabelWithHint: true,
                        // prefixText: "Name:",
                        labelText: "Client's Remarks",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(new Radius.circular(2.0))),
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildRow2(label1: "Client Name", label2: " Office"),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text("Sign here"),
                        FlatButton.icon(
                            onPressed: () {
                              setState(() {
                                return _signatureCanvas.clear();
                              });
                            },
                            icon: Icon(Icons.clear),
                            label: Text("Clear")),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                          onVerticalDragUpdate: (context) {},
                          child: _signatureCanvas
                          /*Signature(
                          //backgroundColor: Colors.grey.withOpacity(0.2),

                         height: 150,
                         width: 400,
                        ),*/
                          ),
                      // height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, style: BorderStyle.solid),
                      ),
                    ),

                    SizedBox(height: 10),
                    RaisedButton(
                        color: Colors.deepPurple,
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          final form = _formKey2.currentState;

                          if (_signatureCanvas.isNotEmpty) {
                            var signData = await _signatureCanvas.exportBytes();
                           // workForm.licenseImageFilePath = workForm.licenseImageFile.path(signData);
                           workForm.licenseImageFilePath =  signData;
                           // workForm.licenseImageFilePath = signData;
                          }
                          if (form.validate()) {
                            form.save();
                            // Form is saved, perform the login now.
                            // }
                            workForm.processApplication();
                            Navigator.pop(context);
                            // ScreenshotShareImage.takeScreenshotShareImage();
                            //sendFormData2Email();
                          }
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildRow1(String labelName) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // SizedBox(width: 10),
        Flexible(
          child: TextFormField(
            // maxLength: 50,
            decoration: InputDecoration(
              labelText: "$labelName",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(new Radius.circular(2.0))),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildRow2({String label1, label2}) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // SizedBox(width: 10),
        Flexible(
          child: TextFormField(
            // maxLength: 50,
            decoration: InputDecoration(
              labelText: label1,
              // prefixText: "Office:",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(new Radius.circular(2.0))),
            ),
          ),
        ),
        SizedBox(width: 8),
        Flexible(
          child: TextFormField(
            // maxLength: 50,
            decoration: InputDecoration(
              labelText: label2,
              // prefixText: "Office:",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(new Radius.circular(2.0))),
            ),
          ),
        ),
      ],
    );
  }

  void sendFormData2Email() {}

/*  clear() {


      setState(() {
        return Signature.clear();
      });
    },*/

}
