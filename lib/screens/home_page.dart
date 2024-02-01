import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'package:taskmate/provider/task_provider.dart';
import 'package:taskmate/utils/routes/routes_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool value = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 40,
        ),
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.taskaddpage);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Text(
          'Task Mate',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Hive.openBox('TaskListNew2'),
        builder: (context, AsyncSnapshot<Box<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data != null) {
              // List<dynamic> values = snapshot.data!.values!.toList();
              // List<dynamic> keys = snapshot.data!.keys!.toList();
              var box = Hive.box('TaskListNew2');


              List taskList = box.values.toList().reversed.toList();



              return ListView.separated(

                itemBuilder: (context, index)  {
                  var taskData1 = taskList[index];

                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      color: Colors.grey.shade100,
                      child: ListTile(




                        trailing: const Icon(
                          Icons.notifications,
                          size: 30,
                        ),
                        title: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text('Title  :  ${taskData1[0]}',style: TextStyle(fontSize: 16),),
                              Text('Detail : ${taskData1[1]}',style: TextStyle(fontSize: 16),),
                              Text('Time   : ${taskData1[2]}',style: TextStyle(fontSize: 16),),
                              Text('Date   : ${taskData1[3]}',style: TextStyle(fontSize: 16),),


                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {

                  return const SizedBox(
                    height: 1,
                  );
                },

                itemCount: taskList.length,
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {

              return Text('Data is null');
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
