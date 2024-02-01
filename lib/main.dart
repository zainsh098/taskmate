import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:taskmate/maps.dart';
import 'package:taskmate/provider/task_provider.dart';
import 'package:taskmate/screens/home_page.dart';

import 'package:taskmate/screens/task_add_page.dart';
import 'package:taskmate/utils/routes/routes.dart';
import 'package:taskmate/utils/routes/routes_name.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  var directory=await getApplicationDocumentsDirectory();
  Hive.init(directory.path);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>DateProvider()),
      ChangeNotifierProvider(create: (_)=>TimeProvider()),
      ChangeNotifierProvider(create: (_)=>TaskProvider()),




    ],child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskMate',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashpage,
      onGenerateRoute:Routes.generateRoute,
    ),);
  }
}

