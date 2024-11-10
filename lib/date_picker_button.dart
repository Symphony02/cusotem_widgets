import 'package:flutter/material.dart';

class DatePickerButton extends StatelessWidget {
  final Function(DateTime) onDateSelected;

  const DatePickerButton({Key? key, required this.onDateSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (selectedDate != null) {
          onDateSelected(selectedDate);
        }
      },
      child: Text('Select Date'),
    );
  }
}
