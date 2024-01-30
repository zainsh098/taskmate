import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskmate/utils/routes/routes_name.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool
   value=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add,size: 40,),
         onPressed: () {
           //Navigator.pushNamed(context, RoutesName.taskaddpage);


       },),



      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Text('Task Mate',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),centerTitle: true,),
          body: Column(
            children: [
              SizedBox(height: 20,),



             FutureBuilder(future: Hive.openBox('TaskList'), builder: (context, snapshot) {

               return Expanded(
                 child: ListView.separated(



                     itemBuilder: (context, index) {

                       return  Padding(
                         padding: const EdgeInsets.only(left: 10,right: 10),
                         child: Card(
                           child: ListTile(
                             leading: Checkbox(value: this.value, onChanged: (value) {
                               setState(() {
                                 this.value=value!;
                               });

                             },),
                             trailing: Icon(Icons.notifications,size: 30,),

                             title: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [

                                 String key=snapshot.data.keys.elementAt(index);
                                 SizedBox(height: 10,),



                               ],


                             ),
                           ),
                         ),
                       );


                     }, separatorBuilder: (context, index) {
                   return SizedBox(height: 1,);
                 }, itemCount: 6),
               );

             },)






            ],


          ),

    );
  }
}
