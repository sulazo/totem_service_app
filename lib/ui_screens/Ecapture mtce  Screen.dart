import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter_datetime_formfield/flutter_datetime_formfield.dart';
import 'package:totem_service_app/widgets/signature_pad.dart';

import 'Landing Page.dart';

/*class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Capture',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}*/

class ImageCapture extends StatefulWidget {
  static const String id = "ImageCapture";
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  GlobalKey _containerKey = GlobalKey();
  Reference reference = FirebaseStorage.instance.ref();
  bool loading = false;

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _workFocus = FocusNode();
  Widget rowSpacer = Container(
    height: 10.0,
  );

  void convertWidgetToImage() async {
    RenderRepaintBoundary renderRepaintBoundary =
        _containerKey.currentContext.findRenderObject();
    ui.Image boxImage = await renderRepaintBoundary.toImage(pixelRatio: 1);
    ByteData byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uInt8List = byteData.buffer.asUint8List();
    this.setState(() {
      loading = true;
    });
    reference
        .child("IMG_${DateTime.now().millisecondsSinceEpoch}.png")
        .putData(uInt8List);

    this.setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff153a54),

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LandingPage(),
            ),
          ),
        ),
        //  backgroundColor: Color(0xff153a54),
        centerTitle: true,
        title: Text("Maintenance Report"),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, //Color(0xff153a54),
          ),
          padding: EdgeInsets.only(top: 8, left: 8, right: 8),
          height: MediaQuery.of(context).size.height,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RepaintBoundary(
                key: _containerKey,
                child: Container(
                  decoration: BoxDecoration(
                      /* border: Border.all(
                      color: Colors.black,
                      width: 4,
                    ),*/
                      ),
                  child: Column(
                    // fit: StackFit.expand,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              /* DateFieldWidget(
                      // onXaved: () {},
                      ),*/
                              DateTimeFormField(
                                  initialValue: DateTime.now(),
                                  label: "Date Time"),
                              rowSpacer,
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                focusNode: _nameFocus,
                                onFieldSubmitted: (term) {
                                  _fieldFocusChange(
                                      context, _nameFocus, _workFocus);
                                },

                                // controller: _nameTextController,
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

                                // validator: _validateName,
                                inputFormatters: <TextInputFormatter>[
                                  LengthLimitingTextInputFormatter(35),
                                ],
                              ),
                              rowSpacer,
                              TextFormField(
                                textInputAction: TextInputAction.done,
                                focusNode: _workFocus,

                                onFieldSubmitted: (value) {
                                  _workFocus.unfocus();
                                },

                                // controller: _descriptionTextController,
                                maxLines: 5,
                                validator: (String text) {
                                  if (text.length < 10)
                                    return " Enter full details of work done";
                                  else
                                    return null;
                                },
                                decoration: InputDecoration(
                                  icon: Icon(Icons.description),
                                  //prefixText: "Description of work order requested",
                                  labelText: "Description of Work",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      new Radius.circular(2.0),
                                    ),
                                  ),
                                ),
                              ),
                              rowSpacer,
                              SignaturePad(),
                              rowSpacer,
                              Container(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.only(left: 35),
                                decoration: BoxDecoration(border: Border.all()),
                                child: Text(
                                    "By signing,I acknowledge and confirm the description of work  done as stated above ."),
                              ),
                            ]),
                      ),
                      (loading)
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Center()
                    ],
                  ),
                ),
              ),
              MaterialButton(
                  color: Colors.deepOrange,
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    convertWidgetToImage();
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
/*
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';

class ImageCapture extends StatefulWidget {
  static const String id = 'ImageCapture';

  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  //bool loading = false;
  final storageReference = FirebaseStorage.instance.ref();
  GlobalKey _globalKey;

  void convertImageToWidget() async {
    RenderRepaintBoundary renderRepaintBoundary =
        _globalKey.currentContext.findRenderObject();
    ui.Image boxImage = await renderRepaintBoundary.toImage(pixelRatio: 1);
    ByteData byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uInt8list = byteData.buffer.asUint8List();
    */
/* setState(() {
      loading = true;
    });*/ /*

    await storageReference
        .child("IMG ${DateTime.now().millisecondsSinceEpoch}")
        .putData(uInt8list);
    //await uploadTask.onComplete;

    */
/*  setState(() {
      loading = false;
    });*/ /*

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RepaintBoundary(
            key: _globalKey,
            child: Container(
              height: 700,
              child: Image.network(
                "https://images.unsplash.com/photo-1550030272-2695f03d3088?ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDV8Ym84alFLVGFFMFl8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          RaisedButton(
              child: Text("Submit"),
              onPressed: () {
                convertImageToWidget();
              })
        ],
      ),
    );
  }
}
*/
