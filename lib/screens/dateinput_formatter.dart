/*
TextEditingController _birthdayTextController = TextEditingController();

final UsDateTextInputFormatter _dateTextInputFormatter =
UsDateTextInputFormatter();

String _validateDate(String value) {
  final RegExp dateExp =
  RegExp(r'^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$');
  if (!dateExp.hasMatch(value)) return 'mmddyyyy';
  return null;
}

TextFormField(
keyboardType: TextInputType.datetime,
decoration: kTextFieldDecoration.copyWith(
hintText: 'Birthday mm/dd/yyyy'),
controller: _birthdayTextController,
validator: _validateDate,
onSaved: (String value) {
applicant.birthday = value;
},
inputFormatters: <TextInputFormatter>[
LengthLimitingTextInputFormatter(10),
WhitelistingTextInputFormatter.digitsOnly,
_dateTextInputFormatter,
],
)
*/
