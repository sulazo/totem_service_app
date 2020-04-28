import 'dart:io' as io;
import 'package:flutter_mailer/flutter_mailer.dart';

class Applicant {
  String applicantJson;
  String pathName;
  io.Directory directory;
  io.File applicantFile;
  String name = '';
  String phoneNumber = '';
  String email = '';
  String office = '';
  String description = '';
  String licenseImageFilePath = '';
  io.File licenseImageFile;

  void processApplication() async {
    var mailBody = """
      <html>
      <h2>Service Request Details </h2>
      <hr/>
       <p><b>Name:<b> $name</p>
      <p><b>Phone Number:<b> $phoneNumber</p>
       <p><b>Email:<b> $email</p>
      <p><b>Work order request description:</p>
     <p>$description </p>
     
      </html>""";

    final MailOptions mailOptions = MailOptions(
      body: mailBody,
      subject: 'C.B.N Service Request',
      recipients: ['sulazo@yahoo.com'],
      isHTML: true,
      ccRecipients: [''],
    );

    await FlutterMailer.send(mailOptions);
  }
}
