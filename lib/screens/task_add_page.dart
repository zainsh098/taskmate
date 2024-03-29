import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:taskmate/provider/task_provider.dart';
import 'package:taskmate/utils/utils.dart';

class TaskAddPage extends StatefulWidget {
  const TaskAddPage({Key? key}) : super(key: key);

  @override
  State<TaskAddPage> createState() => _TaskAddPageState();
}

class _TaskAddPageState extends State<TaskAddPage> {
  TextEditingController timeInput = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController taskInput = TextEditingController();
  TextEditingController detailInput = TextEditingController();

  Utils util = Utils();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timeInput.dispose();
    dateInput.dispose();
    taskInput.dispose();
    detailInput.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TaskProvider taskProvider = Provider.of<TaskProvider>(context);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Text(
          'Task Add',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Title'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: taskInput,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Details'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: detailInput,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Time'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                onTap: () async {
                  await util.selectTime(context);
                  setState(() {
                    timeInput.text = util.selectedTime.format(context);
                  });
                },
                controller: timeInput,
                decoration: const InputDecoration(
                  icon: Icon(Icons.timer),
                  labelText: 'Enter Time',
                ),
                readOnly: true,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Date'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                readOnly: true,
                onTap: () async {
                  await util.selectDate(context);
                  setState(() {
                    dateInput.text = util.dateInputController.text;
                  });
                },
                controller: dateInput,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
           Consumer<TaskProvider>(builder: (context, value, child) {
             return  Center(
               child: ElevatedButton(
                 style: const ButtonStyle(
                   backgroundColor: MaterialStatePropertyAll(Colors.blue),
                   minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                 ),
                 onPressed: () async {

                   List<dynamic> taskData=[
                     taskInput.text,
                     detailInput.text,
                     timeInput.text,
                     dateInput.text,




                   ];
                   String uniqueId = DateTime.now().millisecondsSinceEpoch.toString();

                   value.addTask(taskData);
                   var box=await Hive.openBox('TaskListNew2');
                   box.put(uniqueId, taskData);

                 },
                 child: const Text('Create task',
                     style: TextStyle(color: Colors.white)),
               ),
             );
           },)
          ],
        ),
      ),
    );
  }
}
