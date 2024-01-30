import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskmate/utils/utils.dart';

class TaskAddPage extends StatefulWidget {
  const TaskAddPage({Key? key}) : super(key: key);

  @override
  State<TaskAddPage> createState() => _TaskAddPageState();
}

class _TaskAddPageState extends State<TaskAddPage> {

  TextEditingController timeInput = TextEditingController();
  TextEditingController dateInput = TextEditingController();
Utils util=Utils();


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Text(
          'Task Add',
          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Title'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
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
                onTap:  () async {
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
                onTap: () async{
          await  util.selectDate(context);
          setState(() {
            dateInput.text=util.dateInputController.text;

          });


                },
                controller:dateInput ,


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
            const SizedBox(height: 30,),
            Center(
              child: ElevatedButton(




                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                ),
                onPressed: () async {
                  Map<String,dynamic> userData={

                    'Zain 1':20,
                    'Zain 2':21,
                    'Zain 3':22,
                    'Zain 4':23,
                    'Zain 5':24,
                    'Zain 6':25,
                    'Zain 6':26,
                    'Zain 8':27,

                  };


                var box=await Hive.openBox('TaskList');

                box.putAll(userData);
                box.add('ahsan');

                print(box.get('Zain 1'));







                },
                child: const Text('Create task', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
