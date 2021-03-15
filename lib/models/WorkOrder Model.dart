import 'dart:io' as io;
//import 'dart:convert';
import 'package:flutter_mailer/flutter_mailer.dart';
//import 'package:path_provider/path_provider.dart';

class WorkForm {
  //io.Directory directory;
  // String date = " ";
  String engineersName = '';
  String office = '';
  io.File imageFile;
  DateTime dateTime;

  /* Future<bool> loadWorkOrder() async {
    bool status = false;
    // load method
    // This is like a constructor, but has to be separate because
    // a constructor can't be async
    directory = await getApplicationDocumentsDirectory();
    pathName = directory.path + "/save.json";
    workOrderFile = io.File(pathName);

    try {
      // workOrderJson = workOrderFile.readAsStringSync();
      Map<String, dynamic> applicantMap = jsonDecode(workOrderJson);

      engineersName = applicantMap['name'];
      date = applicantMap['date'];
      office = applicantMap['department'];

      filePath = applicantMap['licenseImageFilePath'];

      if (filePath != '') {
        imageFile = io.File(filePath);
      }
      status = true;
    } catch (e) {
      print(e);
    }

    return status;
  }*/

  void processApplication() async {
    var mailBody = """
      <html>
       <h1>Maintenance Details</h1>
       <p><b>Engineer Name:<b> $engineersName</p>
       <p><b>Date:<b> $dateTime</p>
       <p> <b>Office :<b> $office</p> 
      
    </html>""";

    final MailOptions mailOptions = MailOptions(
        body: mailBody,
        subject: 'Maintenance Report ',
        recipients: ['sulazo@yahoo.com'],
        isHTML: true,
        bccRecipients: [''],
        ccRecipients: [''],
        attachments: [imageFile.path]);

    await FlutterMailer.send(mailOptions);
  }
}
