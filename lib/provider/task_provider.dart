

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier{

List<dynamic> _taskList=[];

List<dynamic> get  taskList=> _taskList;

void addTask(dynamic taskData) {
  _taskList.add(taskData);
  notifyListeners();
}



}














class DateProvider extends ChangeNotifier{

  DateTime? _selectedDate;

  DateTime? get selectedDate=> _selectedDate;

  void  setSelectedDate(DateTime dateTime)
  {
    _selectedDate=dateTime;
    notifyListeners();


  }





}



class TimeProvider extends ChangeNotifier{
   TimeOfDay? _selectedTime;
   TimeOfDay? get selectedTime=>_selectedTime;
   void setSelectedTime(TimeOfDay time)
   {

     _selectedTime=time;
     notifyListeners();
   }









}




