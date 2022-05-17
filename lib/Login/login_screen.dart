import 'dart:convert';
import 'dart:developer';
import 'package:easycare/Branch/branch_API.dart';
import 'package:easycare/Splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nametextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();
  TextEditingController branchtextEditingController = TextEditingController();

  bool isChecked = false;
  BranchServices branchServices = BranchServices();
  String dropdownValueBranch = "Select Branch";

  void validateForm() async {
    if (kDebugMode) {
      // log("Json Data Status Code is $dropdownValueBranch");
    }
    if (nametextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Email Address Invalid");
    } else if (passwordtextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Password is Required.");
    } else if (dropdownValueBranch == "Select Branch") {
      Fluttertoast.showToast(msg: "You have to select branch first");
    } else {
      login();
    }
  }

  final _accesstoken = [];

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.white;
    }

    return Scaffold(
      //backgroundColor: Colors.blue,
               body: SingleChildScrollView(
                 scrollDirection: Axis.vertical,
                 child: Container(
                   height: MediaQuery.of(context).size.height,
              decoration:const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xff86a2d7),
                      const Color(0xff3667d4),

                    ],
              ),

              ),
              child: Column(
                  children: [

                          Container(
                            padding: EdgeInsets.only(top: 150, left: 35, right: 200),
                            child: const Text(
                              "Welcome ! ",
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only( left: 42, right: 230),

                            child: const Text(
                              "Sign in to Continue.",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            width: 310,
                            margin: EdgeInsets.only(left:15,right: 15),
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                            child: FutureBuilder(
                              future: branchServices.fetchBranchApiFromUrl(),
                              // initialData: InitialData,
                              builder:
                                  (BuildContext context, AsyncSnapshot snapshot) {
                                    if (!snapshot.hasData) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                if (snapshot.hasData) {
                                  try {
                                    final snapshotData = snapshot.data;
                                    return Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: DropdownButton<String>(
                                        value: dropdownValueBranch,

                                        icon: const Icon(Icons.arrow_downward,color: Colors.white,),
                                       // elevation: 16,
                                        style:
                                            const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValueBranch = newValue!;
                                          });
                                        },
                                        items: snapshotData
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    );
                                  } catch (e) {
                                    throw Exception(e);
                                  }
                                } else {
                                  return Text(snapshot.error.toString());
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 25,),
                    Container(
                      padding: EdgeInsets.only(left: 50,right: 50),
                      child: TextField(
                        controller: nametextEditingController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                            contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 25.0,),
                          Container(
                            padding: EdgeInsets.only(left: 50,right: 50),
                            child: TextField(
                              controller: passwordtextEditingController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                                ),
                                contentPadding: EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)
                                )
                              ),
                            ),
                          ),
                          SizedBox(height: 35.0,),

                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 35),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      shape: CircleBorder(),
                                      //tristate: true,
                                      checkColor: Colors.black,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(getColor),
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                    Container(
                                      child: Text(
                                        "Remember me",
                                        style: TextStyle(color: Colors.white,fontSize: 17),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 40.0,),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 35,),
                          Container(
                            padding: EdgeInsets.only(left: 120, right: 120),
                            child: ElevatedButton(
                                onPressed: () async {
                                  validateForm();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  minimumSize: const Size.fromHeight(45),
                                  maximumSize: const Size.fromHeight(45),
                                ),

                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Colors.black,
                                   // fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                )),
                          ),

                        ],
                      ),
            ),
               ),




          );

  }

  Future<void> login() async {
    var response = await http.post(
      Uri.parse(
          "https://api-soori-ims-staging.dipendranath.com.np/api/v1/user-app/login"),
      // headers: {
      //   'Content-Type': 'application/json',
      //   'Accept': 'application/json'
      // },
      body: ({
        'user_name': nametextEditingController.text,
        'password': passwordtextEditingController.text,
      }),
    );

    if (response.statusCode == 200) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("access_token",
          json.decode(response.body)['tokens']['access'] ?? '#');
      sharedPreferences.setString("refresh_token",
          json.decode(response.body)['tokens']['refresh'] ?? '#');
      sharedPreferences.setString("user_name", nametextEditingController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      /*if (kDebugMode) {
        log(json.decode(response.body)['detail'].toString());
      }*/
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(json.decode(response.body)['detail'].toString())));
    }
  }
}

////// branch (background   change  all when filled ..... round branch *** )
///
