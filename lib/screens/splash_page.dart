
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmate/screens/home_page.dart';
import 'package:taskmate/utils/routes/routes_name.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {






  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    Future.delayed(const Duration(seconds: 5),() {
      Navigator.pushNamed(context, RoutesName.homepage);

    },);


  }


  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height*1;
    final width=MediaQuery.sizeOf(context).width*1;

    return  Scaffold(
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SvgPicture.asset('assets/images/splash.svg',
                width: width * 0.99,



              ),
              const SizedBox(height: 50,),

              const SpinKitFadingCircle(size: 55,

                color: Colors.blue,
              )

            ],

          )


      ),



    );
  }
}
