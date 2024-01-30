import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmate/screens/completed_task.dart';
import 'package:taskmate/screens/splash_page.dart';
import 'package:taskmate/screens/task_add_page.dart';
import 'package:taskmate/utils/routes/routes_name.dart';

class Routes{


  static Route<dynamic> generateRoute(RouteSettings settings)
  {

    switch(settings.name)
        {
      case RoutesName.splashpage:
        return MaterialPageRoute(builder: ( BuildContext context) => const SplashPage(),);
      case RoutesName.homepage:
        return MaterialPageRoute(builder: ( BuildContext context) => const SplashPage(),);
      case RoutesName.taskaddpage:
        return MaterialPageRoute(builder: ( BuildContext context) => const TaskAddPage(),);
      case RoutesName.completedpage:
        return MaterialPageRoute(builder: ( BuildContext context) => const TaskCompleted(),);
      default: return MaterialPageRoute(builder: (_)
      {
        return  Scaffold(
          body: Center(
            child: ErrorWidget.withDetails(message: 'No Screen Added'),

          ),

        );



      });

        }











  }











}