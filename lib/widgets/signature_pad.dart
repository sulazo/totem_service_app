import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignaturePad extends StatefulWidget {
  @override
  _SignaturePadState createState() => _SignaturePadState();
}

class _WatermarkPaint extends CustomPainter {
  final String price;
  final String watermark;

  _WatermarkPaint(this.price, this.watermark);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    /* canvas.drawCircle(Offset(size.width / 2, size.height / 2), 10.8,
        Paint()..color = Colors.blue);*/
  }

  @override
  bool shouldRepaint(_WatermarkPaint oldDelegate) {
    return oldDelegate != this;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _WatermarkPaint &&
          runtimeType == other.runtimeType &&
          price == other.price &&
          watermark == other.watermark;

  @override
  int get hashCode => price.hashCode ^ watermark.hashCode;
}

class _SignaturePadState extends State<SignaturePad> {
  ByteData _img = ByteData(0);
  var color = Colors.black;
  var strokeWidth = 3.0;
  final _sign = GlobalKey<SignatureState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Text("Signature Application"),
        Container(
          //  margin: EdgeInsets.only(left: 35, bottom: 0, top: 10),
          decoration: BoxDecoration(
            border: Border.all(width: 2),
          ),
          height: 200,
          child: Signature(
            color: color,
            key: _sign,
            onSign: () {
              final sign = _sign.currentState;
              debugPrint('${sign.points.length} points in the signature');
            },
            backgroundPainter: _WatermarkPaint("2.0", "2.0"),
            strokeWidth: strokeWidth,
          ),
          // color: Colors.black12,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(FontAwesomeIcons.fileSignature),
            Text(
              "  Customer Signature",
              //textAlign: TextAlign.center,
            ),
            IconButton(
              icon: Icon(Icons.cancel),
              color: Colors.red,
              iconSize: 25,
              onPressed: () {
                final sign = _sign.currentState;
                sign.clear();
                setState(() {
                  _img = ByteData(0);
                });
                //debugPrint("cleared");
              },
            )
          ],
        )
      ],
    );
  }
}
