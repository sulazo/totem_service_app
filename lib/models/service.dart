//import 'dart:io' as io;
//import 'dart:convert';
//import 'package:path_provider/path_provider.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

class ServiceForm {
  String pathName;
  String  date;
  String name = '';
  String office='';
  String phoneNumber = '';
  String email = '';
  String description = '';



  void processApplication() async {
    var mailBody = """
      <html>
      <p><b>Name:<b> $name</p>
      <p><b>Date:<b> $date</p>
      <p><b>Phone Number:<b> $phoneNumber</p>  
      <p> <b>Office :<b> $office</p>    
      
      <p><b>Description of service request:<br> $description</p>
     
     
      </html>""";



    final MailOptions mailOptions = MailOptions(
      body: mailBody,
      subject: 'CBN Service Request Form ',
      recipients: ['sulazo@yahoo.com'],
      isHTML: true,
      bccRecipients: [''],
      ccRecipients: [''],
    );

    await FlutterMailer.send(mailOptions);
  }


}
