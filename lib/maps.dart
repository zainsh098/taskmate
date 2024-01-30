
import 'package:flutter/material.dart';





class Learnmap extends StatefulWidget {
  const Learnmap({super.key});

  @override
  State<Learnmap> createState() => _LearnmapState();
}

class _LearnmapState extends State<Learnmap> {
  final Map<String ,dynamic> userData={
    'name':'Zain',
    'email':'zainsh.cs@gmail.com',




};


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40,),


          Text('Name is :${userData.update('Eve', (value) =>'ahmed',ifAbsent: () => 'alikhan',)}'),

          Center(
            child: ElevatedButton(onPressed: () {











              Map<String,int> ageMap={
                'Zain':35,
                'Ahsan':33,
                'Tam':32,
                'Nisha':31,



              };





              ageMap['ali']=30;

              ageMap.forEach((key, value) {
              print('$key\'s age: $value');

              });

            }, child: Text('Hi')),
          )

        ],

      ),

    );
  }
}

