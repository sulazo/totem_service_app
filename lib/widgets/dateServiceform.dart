import 'package:flutter/material.dart';
import 'package:flutter_datetime_formfield/flutter_datetime_formfield.dart';
import 'package:intl/intl.dart';
import 'package:totem_service_app/models/applicant.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    Key key,
    @required this.applicant,
  }) : super(key: key);

  final Applicant applicant;

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      formatter: DateFormat("EE, MMM d, yyyy h:mma"),
      initialValue: DateTime.now(),
      label: "Date Time",
      validator: (DateTime dateTime) {
        if (dateTime == null) {
          return "Date Time Required";
        }
        return null;
      },
      onSaved: (DateTime dateTime) => applicant.dateTime = dateTime,
    );
  }
}
