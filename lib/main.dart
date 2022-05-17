
import 'package:easycare/Splash/splash_screen.dart';

import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return
       MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Easycare',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:  HomeScreen(),
      );

  }
}

