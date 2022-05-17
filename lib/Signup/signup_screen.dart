import 'package:easycare/Login/login_screen.dart';
import 'package:easycare/Splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nametextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();
  TextEditingController branchtextEditingController = TextEditingController();
  TextEditingController confirmpasswordtextEditingController = TextEditingController();

  void validateForm() async{
    if (!emailtextEditingController.text.contains("@"))
    {
      Fluttertoast.showToast(msg:"Email Address Invalid");
    }

    else if (passwordtextEditingController.text.isEmpty  )
    {
      Fluttertoast.showToast(msg:"Password is Required.");
    }
    else if (passwordtextEditingController.text.length<6  )
    {
      Fluttertoast.showToast(msg:"Password is Required.");
    }

    else if (nametextEditingController.text.isEmpty )
    {
      Fluttertoast.showToast(msg:"Enter your name");
    }
    else if (branchtextEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(msg: "You have to select branch first");
    }
    else if (passwordtextEditingController.text!=confirmpasswordtextEditingController.text)
      {
        Fluttertoast.showToast(msg: "Password doesnot match , Try again ");
      }
    else
    {
      createEmployee();
    }

  }
  createEmployee() async{
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }

  bool isChecked= false;
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
      return Colors.red;
    }
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 600,
                  margin: const EdgeInsets.symmetric(vertical: 130, horizontal: 20),
                  decoration: BoxDecoration(
                    boxShadow:const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: -5,
                        blurRadius: 17,
                        offset: Offset(0, 3),
                      )
                    ],
                    border: Border.all(width: 0.5, color: Colors.white),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(18.0),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blueAccent,
                        Color.fromARGB(90,70, 50, 200),
                      ],
                    ),
                  ),

                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 30,left: 0,right: 10),
                        child: const Text("Welcome ! ",
                          style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white

                          ),
                        ),
                      ),

                      SizedBox(height: 10,),



                      Container (
                        child:const  Text("Add the Customer",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,


                          ),
                        ),

                      ),
                      SizedBox(height: 8,),
                    
                      Container(
                        padding: EdgeInsets.only(left: 15,right: 30),
                        child: TextField(

                            controller: nametextEditingController,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration:const InputDecoration(
                              icon:  Icon(Icons.person, color: Color(
                                  0xffaf3030)),
                              labelText: "Name",
                              hintText: "Enter the name of the customer",

                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),

                            )),
                      ),


                      Container(
                        padding: EdgeInsets.only(left: 15,right: 30),
                        child: TextField(

                            controller: emailtextEditingController,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration:const InputDecoration(
                              icon:  Icon(Icons.drafts_outlined, color: Color(
                                  0xffaf3030)),
                              labelText: "Email",
                              hintText: "Enter the Email",

                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),

                            )),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15,right: 30),
                        child: TextField(

                            controller: branchtextEditingController,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration:const InputDecoration(
                              icon:  Icon(Icons.home, color: Color(
                                  0xffaf3030)),
                              labelText: "Branch",
                              hintText: "Enter the branch",

                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),

                            )),
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 15,right: 30),
                        child: TextField(
                           controller: passwordtextEditingController,
                            keyboardType: TextInputType.text,
                            obscureText: true,


                            style:const  TextStyle(
                              color: Colors.white,
                            ),
                            decoration:const InputDecoration(
                              icon:  Icon(Icons.lock, color: Color(
                                  0xffaf3030)),
                              labelText: "Password",
                              hintText: "Enter the Password",


                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),

                            )),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15,right: 30),
                        child: TextField(
                            controller: confirmpasswordtextEditingController,
                            keyboardType: TextInputType.text,
                            obscureText: true,

                            style:const  TextStyle(
                              color: Colors.white,
                            ),
                            decoration:const InputDecoration(
                              icon:  Icon(Icons.lock, color: Color(
                                  0xffaf3030)),
                              labelText: "Confirm Password",
                              hintText: "Enter the Same password again",


                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),

                            )),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value?? false;
                                });
                              },
                            ),
                            Container(
                              child: Text("Agree Terms & Conditions",
                                style: TextStyle(
                                    color: Colors.white
                                ),),
                            )
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: ElevatedButton(onPressed: (){
                         if ( isChecked == true )
                           {
                             validateForm();
                           }
                         else {
                           Fluttertoast.showToast(msg: "Please Agree the terms and condition to continue");
                         }
                        },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red.withOpacity(0.7),
                              minimumSize: const Size.fromHeight(45),
                              maximumSize: const Size.fromHeight(50),

                            ),
                            child: Text("Create Account",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,


                              ),

                            )),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 35,right: 30),

                        child:

                            TextButton(
                              onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
                              },
                              child: Text("Already have an account? Sign in ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,

                                ),
                              ),
                            ),


                      ),

                    ],

                  ),


                ),



              ],
            ),

          ),
        ),
      ),


    );
  }
}
