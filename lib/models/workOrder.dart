import 'dart:io' as io;
//import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

class WorkForm {

  io.Directory directory;
  io.File applicantFile;
  String pathName;
  String date;
  String name = '';
  String techName = '';
  String office = '';
  String phoneNumber = '';
  String branch = '';
  String clientRemarks = '';
  String techRemarks = '';
  String serviceReport = '';
  String clientName = '';
  String licenseImageFilePath = '';
  io.File licenseImageFile;


  getImage() async {


   //var signData = await _signatureCanvas.exportBytes();

    directory = await getApplicationDocumentsDirectory();
    pathName = directory.path + "/save.image";
    if (licenseImageFile != null) {
      licenseImageFilePath = licenseImageFile.path;
    }

    return applicantFile = io.File(pathName);
  }


  void processApplication() async {
    var mailBody = """
      <html>
      <p><b>Name:<b> $name</p>
      <p><b>Date:<b> $date</p>
      <p><b>Phone Number:<b> $phoneNumber</p>  
      <p> <b>Office :<b> $office</p> 
      p><b>Engineer's Remarks Remarks:<br> $techRemarks</p>   
      
      <p><b>Clients Remarks:<br> $clientRemarks</p>
      attachments: [
      licenseImageFilePath,
                    
      ],
     
     
      </html>""";


    final MailOptions mailOptions = MailOptions(
      body: mailBody,
      subject: 'CBN Service Request Form ',
      recipients: ['sulazo@yahoo.com'],
      isHTML: true,
      bccRecipients: [''],
      ccRecipients: [''],
        attachments: [
          licenseImageFilePath,
        ]
    );

    await FlutterMailer.send(mailOptions);


   /* saveMaintenanceReport() {
      // The applicantFile is initialized in loadApplicant
      if (licenseImageFile != null) {
        licenseImageFilePath = licenseImageFile.path;
      }
    }*/
  }
}