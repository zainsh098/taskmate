import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
        future: Hive.openBox('TaskListData'),
        builder: (context, AsyncSnapshot<Box<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data != null) {
              List<dynamic> values = snapshot.data!.values!.toList();
              List<dynamic> keys = snapshot.data!.keys!.toList();

              return ListView.separated(
                itemBuilder: (context, index)  {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      child: ListTile(
                        trailing: Icon(
                          Icons.notifications,
                          size: 30,
                        ),
                        title: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              Text(values[index].toString()),

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
                itemCount: values.length,
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Handle the case where snapshot.data is null
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
