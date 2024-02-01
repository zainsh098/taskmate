import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:taskmate/provider/task_provider.dart';

 class Utils {
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController timeInputController = TextEditingController();
  TextEditingController dateInputController = TextEditingController();

  DateTime  selectedDate=DateTime.now();



   Future<void> selectTime(BuildContext context) async {
    final TimeProvider timeProvider=Provider.of<TimeProvider>(context,listen: false);

    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime


    );

    if (pickedTime != null && pickedTime != selectedTime) {
     timeProvider.setSelectedTime(pickedTime);


      timeInputController.text = pickedTime.toString();
    }
  }


  Future<void> selectDate(BuildContext context) async {

    final DateProvider dateProvider=Provider.of<DateProvider>(context,listen: false);
   final DateTime? pickedDate = await showDatePicker(
    context: context,
    firstDate: DateTime(2022),
    lastDate: DateTime(2027),
   );

   if (pickedDate != null && pickedDate != selectedDate) {
    dateProvider.setSelectedDate(pickedDate);


    String formattedDate = DateFormat('EEEE, MMM d').format(pickedDate);


     dateInputController.text = formattedDate;

   }
  }


}