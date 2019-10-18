

import 'package:flutter_mailer/flutter_mailer.dart';

class Dbase {

  int _id;
  String _name;
  String _description;
  String _date;
  int _phoneNumber;
  String _email;

  Dbase(this._name, this._date, this._phoneNumber,this._email, [this._description]);



 // Dbase.withId(this._id, this._name, this._date, this._phoneNumber, [this._description]);

  int get id => _id;

  String get title => _name;


  String get email => _email;

  int get phoneNumber => _phoneNumber;

  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._name = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      this._description = newDescription;
    }
  }

  set phoneNumber(int newPriority) {
//    if (newPriority >= 1 && newPriority <= 2) {
//      this._phoneNumber = newPriority;
//    }
  }
  set email(String newEmail) {
    this._email = newEmail;
  }

  set date(String newDate) {
    this._date = newDate;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _name;
    map['description'] = _description;
    map['phoneNumber'] = _phoneNumber;
    map['date'] = _date;
    map['email'] = _email;

    return map;
  }

  // Extract a Note object from a Map object
  Dbase.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['title'];
    this._description = map['description'];
    this._phoneNumber = map['phoneNumber'];
    this._date = map['date'];
    this._email = map['email'];
  }





  void processApplication() async {
    print("submit pressed");
    var mailBody = """
      <html>
      <h1>Rental Application</h1>
      <br>
      <p><b>Name:<b> $_name</p>
      <p><b>Phone:<b> $_phoneNumber </p>
      <p><b>email:<b> $_email</p>
      
      </html>""";

    final MailOptions mailOptions = MailOptions(
      body: mailBody,
      subject: 'Serivice Request $_name',
      recipients: ['sulazo@yahoo.com'],
      isHTML: true,
      bccRecipients: [''],
      ccRecipients: [''],

    );

    await FlutterMailer.send(mailOptions);
  }
}
