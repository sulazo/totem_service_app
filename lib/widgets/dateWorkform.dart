import 'package:flutter/material.dart';
import 'package:flutter_datetime_formfield/flutter_datetime_formfield.dart';
import 'package:totem_service_app/models/Work%20Order%20Form%20Model.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    @required this.workForm,
  });

  final WorkForm workForm;

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      initialValue: DateTime.now(),
      label: "Date Time",
      validator: (DateTime dateTime) {
        if (dateTime == null) {
          return "Date Time Required";
        }
        return null;
      },
      onSaved: (DateTime dateTime) => workForm.dateTime = dateTime,
    );
  }
}
