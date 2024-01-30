import 'package:flutter/material.dart';


class TaskCompleted extends StatefulWidget {
  const TaskCompleted({super.key});

  @override
  State<TaskCompleted> createState() => _TaskCompletedState();
}

class _TaskCompletedState extends State<TaskCompleted> {
  bool value=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Text('Task Completed',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),centerTitle: true,),
        body: Column(
          children: [

            SizedBox(height: 30,),

            Expanded(
              child: ListView.separated(


                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Card(
                        child: ListTile(
                          
                          trailing:Container(
                            padding: EdgeInsets.symmetric(horizontal: 7),
                          decoration: BoxDecoration(


                              color: Colors.green,borderRadius: BorderRadius.circular(20)),


                            child: Text('Completed',style: TextStyle(color: Colors.white,fontSize: 15,),),),

                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text('Title: Tea Make '),
                              SizedBox(height: 10,),
                              Text('Time'),
                              Text('Date')


                            ],


                          ),
                        ),
                      ),
                    );


                  }, separatorBuilder: (context, index) {
                return SizedBox(height: 1,);
              }, itemCount: 6),
            )



          ],


        ),

    );
  }
}
