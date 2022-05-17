import 'dart:async';
import 'dart:developer';
import 'package:easycare/Login/login_screen.dart';
import 'package:easycare/MainPage/main_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


String? finalName;
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? finalToken;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValidation().whenComplete(() async {
      if(kDebugMode){
        log(finalToken.toString());
      }
      Timer(
          const Duration(seconds: 2),
          () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => finalToken == null
                      ? const LoginScreen()
                      : const MainScreen())));
    });
  }

  Future getValidation() async {
    final SharedPreferences pref =
        await SharedPreferences.getInstance();
    var obtaintoken = pref.getString("access_token");
    var obtainname = pref.getString("user_name");
    setState(() {
      finalToken = obtaintoken!;
      finalName = obtainname!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Splash Screen"),
      ),
    );
  }
}
