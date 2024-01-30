import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

 class Utils {
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController timeInputController = TextEditingController();
  TextEditingController dateInputController = TextEditingController();

  DateTime  selectedDate=DateTime.now();



   Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime


    );

    if (pickedTime != null && pickedTime != selectedTime) {
     selectedTime=pickedTime;

      timeInputController.text = pickedTime.toString();
    }
  }


  Future<void> selectDate(BuildContext context) async {
   final DateTime? pickedDate = await showDatePicker(
    context: context,
    firstDate: DateTime(2022),
    lastDate: DateTime(2027),
   );

   if (pickedDate != null && pickedDate != selectedDate) {
    selectedDate = pickedDate;


    String formattedDate = DateFormat('EEEE, MMM d').format(selectedDate);


     dateInputController.text = formattedDate;

   }
  }


}