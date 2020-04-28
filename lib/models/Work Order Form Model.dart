import 'dart:io' as io;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

class WorkForm {
  io.Directory directory;
  io.File applicantFile;
  String applicantJson;
  String pathName;
  String date = " ";
  String engineersName = '';
  String office = '';
  String licenseImageFilePath = '';
  io.File licenseImageFile;

  Future<bool> loadApplicant() async {
    bool status = false;
    // load method
    // This is like a constructor, but has to be separate because
    // a constructor can't be async
    directory = await getApplicationDocumentsDirectory();
    pathName = directory.path + "/save.json";
    applicantFile = io.File(pathName);

    try {
      applicantJson = applicantFile.readAsStringSync();
      Map<String, dynamic> applicantMap = jsonDecode(applicantJson);

      engineersName = applicantMap['name'];
      date = applicantMap['date'];
      office = applicantMap['department'];

      licenseImageFilePath = applicantMap['licenseImageFilePath'];

      if (licenseImageFilePath != '') {
        licenseImageFile = io.File(licenseImageFilePath);
      }
      status = true;
    } catch (e) {
      print(e);
    }

    return status;
  }

  void processApplication() async {
    var mailBody = """
      <html>
       <h1>Totem Service Report</h1>
       <p><b>Engineer's Name:<b> $engineersName</p>
       <p><b>Date:<b> $date</p>
       <p> <b>Office :<b> $office</p> 
      
    </html>""";

    final MailOptions mailOptions = MailOptions(
        body: mailBody,
        subject: 'C.B.N Maintenance Report ',
        recipients: ['sulazo@yahoo.com'],
        isHTML: true,
        bccRecipients: [''],
        ccRecipients: [''],
        attachments: [licenseImageFilePath]);

    await FlutterMailer.send(mailOptions);
  }

  Future<String> getDirectoryPath() async {
    final directory = await getApplicationDocumentsDirectory();
    String pathName = directory.path;
    return pathName;
  }

  //void saveApplicant() {}
  saveApplicant() {
    // The applicantFile is initialized in loadApplicant
    if (licenseImageFile != null) {
      licenseImageFilePath = licenseImageFile.path;
    }

    Map<String, String> applicantMap = {
      'name': engineersName,
      'office': office,
      'date': date,
      'licenseImageFilePath': licenseImageFilePath,
    };

    applicantJson = jsonEncode(applicantMap);

    try {
      applicantFile.writeAsStringSync(applicantJson);
    } catch (e) {
      print(e);
    }
  }
}
