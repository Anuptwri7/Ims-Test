import 'dart:async';

import 'package:easycare/Search/search_field.dart';
import 'package:easycare/Splash/splash_screen.dart';
import 'package:easycare/TabPages/AddPropertyTabPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';


class HomeTabPage extends StatefulWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
int _counter=0;
  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

//final SharedPreferences shared =  SharedPreferences.getInstance() as SharedPreferences;



  List _products = [];
  var first_name = "First Name";
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
         appBar: AppBar(
           actions: [
             Icon(Icons.search,color: Color(0xff2c51a4),),
             SizedBox(width: 10,),
             Icon(Icons.notifications_active,color: Color(0xff2c51a4),),
             SizedBox(width: 15,),
           ],
           leading: Icon(Icons.person,color: Colors.orange,),
           title: Text('Hello , $finalName',style: TextStyle(color: Colors.black,fontSize: 16),),
           automaticallyImplyLeading: false,
           backgroundColor: Colors.transparent,
           elevation: 0,
         ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

              child: Padding(
                padding: const EdgeInsets.only(top:30.0,left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                   // SearchField(),
                    // const Padding(
                    //   padding: EdgeInsets.only(top:20,left: 200),
                    //   child: Text("Welcome",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    // ),
                    // Container(
                    //   child: Divider(
                    //     indent: 75,
                    //     endIndent: 10,
                    //     color: Colors.red.withOpacity(0.5),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 200),
                    //   child: Text(
                    //       "$finalName",
                    //
                    //
                    //   style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red,fontStyle: FontStyle.italic),),
                    // ),



                      Container(
                        height: 120,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-1.0, -0.94),
                              end: Alignment(0.968, 1.0),
                              colors: [
                                Color(0xff2c51a4),
                                Color(0xff6b88e8)
                              ],
                              stops: [0.0, 1.0],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100.0),
                              topRight: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0),
                            ),
                            color: Colors.blue
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.only(left:200.0),
                            child: Text('Soori IMS',style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,

                              fontSize: 25
                            ),),
                          ),
                        ),
                      ),
                  SizedBox(height: 20,),
                  Container(
                    height: 300,
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    decoration: BoxDecoration(
                      boxShadow:const [
                        BoxShadow(
                          color: const Color(0x155665df),
                          spreadRadius: 5,
                          blurRadius: 17,
                          offset: Offset(0, 3),
                        )
                      ],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18.0),

                      ),
                     color: Colors.white,


                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap:()=>Navigator.push((context), MaterialPageRoute(builder: (contetx)=>const AddPropertyTabPage())),
                                    child: Container(
                                      height: 75,
                                      width: 75,


                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Icon(Icons.person,color: Color(0xff2C51A4),size: 30,),
                                              Text("Customer"
                                                , style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0xff2C51A4)),
                                              ),
                                              Text("Order"
                                                , style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0xff2C51A4)),
                                              ),
                                            ],
                                          ),
                                        ),

                                      decoration: BoxDecoration(
                                        color: const Color(0xffeff3ff),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:Color(0xffeff3ff),
                                            offset: const Offset(-2,-2),
                                            spreadRadius: 1,
                                            blurRadius: 10,

                                          ),
                                        ],
                                      ),

                                    ),
                                  ),
                                  const SizedBox(width: 30,),


                                  Badge(
                                    badgeColor: Color(0xff2C51A4),
                                    badgeContent: Text(
                                        "$_counter",style: TextStyle(color: Colors.white),
                                    ),
                                    child: Container(
                                      height: 75,
                                      width: 75,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Icon(Icons.person,color: Color(0xff2C51A4),size: 30,),
                                            Text("Customer"
                                              , style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0xff2C51A4)),
                                            ),
                                            Text("Order"
                                              , style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0xff2C51A4)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffeff3ff),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:Color(0xffeff3ff),
                                            offset: const Offset(-2,-2),
                                            spreadRadius: 1,
                                            blurRadius: 10,

                                          ),
                                        ],
                                      ),

                                    ),

                                  ),


                                  const SizedBox(width: 30,),
                                  Badge(
                                    badgeColor: Color(0xff2C51A4),
                                    badgeContent: Text(
                                      "$_counter",style: TextStyle(color: Colors.white),
                                    ),
                                    child: Container(
                                      height: 75,
                                      width: 75,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Icon(Icons.person,color: Color(0xff2C51A4),size: 30,),
                                            Text("Customer"
                                              , style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0xff2C51A4)),
                                            ),
                                            Text("Order"
                                              , style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0xff2C51A4)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color:Color(0xffeff3ff),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:Color(0xffeff3ff),
                                            offset: const Offset(-2,-2),
                                            spreadRadius: 1,
                                            blurRadius: 10,

                                          ),
                                        ],
                                      ),

                                    ),
                                  ),
                                ],

                              ),
                              const SizedBox(height: 25,),
                              Row(
                                children: [
                                  Container(
                                    height: 75,
                                    width: 75,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.person,color: Color(0xff2C51A4),size: 30,),
                                          Text("Customer"
                                            , style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0xff2C51A4)),
                                          ),
                                          Text("Order"
                                            , style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0xff2C51A4)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffEFF3FF),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color:Color(0xffeff3ff),
                                          offset: const Offset(-2,-2),
                                          spreadRadius: 1,
                                          blurRadius: 10,

                                        ),
                                      ],
                                    ),

                                  ),
                                  const SizedBox(width: 30,),
                                  Container(
                                    height: 75,
                                    width: 75,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.person,color: Color(0xff2C51A4),size: 30,),
                                          Text("Customer"
                                            , style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0xff2C51A4)),
                                          ),
                                          Text("Order"
                                            , style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0xff2C51A4)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffeff3ff),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color:Color(0xffeff3ff),
                                          offset: const Offset(-2,-2),
                                          spreadRadius: 1,
                                          blurRadius: 10,

                                        ),
                                      ],
                                    ),

                                  ),
                                  const SizedBox(width: 30,),
                                  Container(
                                    height: 75,
                                    width: 75,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Icon(Icons.person,color: Color(0xff2C51A4),size: 30,),
                                          Text("Customer"
                                            , style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0xff2C51A4)),
                                          ),
                                          Text("Order"
                                            , style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0xff2C51A4)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffeff3ff),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color:Color(0xffeff3ff),
                                          offset: const Offset(-2,-2),
                                          spreadRadius: 1,
                                          blurRadius: 10,

                                        ),
                                      ],
                                    ),

                                  ),
                                ],

                              ),
                              const SizedBox(height: 25,),
                              Container(
                                height: 40,
                                width: 105,
                                child: const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Center(
                                    child: Text("View More"
                                      , style:  TextStyle(color: Color(0xff2C51A4)),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xffeff3ff),
                                      offset: const Offset(5,8),
                                      spreadRadius: 5,
                                      blurRadius: 12,

                                    ),
                                  ],
                                ),

                              ),

                            ],
                          ),
                        ),
                      ],
                    ),


                  ),

                    // Container(
                    //   padding: const EdgeInsets.all(30),
                    //   child: Column(
                    //     children: [
                    //       Row(
                    //         children: [
                    //           GestureDetector(
                    //             onTap:()=>Navigator.push((context), MaterialPageRoute(builder: (contetx)=>const AddPropertyTabPage())),
                    //             child: Container(
                    //               height: 75,
                    //               width: 75,
                    //               child: const Padding(
                    //                 padding: EdgeInsets.only(top:20,left: 10),
                    //                 child: Text("Customer Order"
                    //                 , style:  TextStyle(fontWeight: FontWeight.bold),
                    //                 ),
                    //               ),
                    //               decoration: BoxDecoration(
                    //                 color: Colors.grey.shade300,
                    //                 borderRadius: BorderRadius.circular(22),
                    //                 boxShadow: [
                    //                   BoxShadow(
                    //                     color: Colors.grey.shade500,
                    //                     offset: const Offset(-4,-4),
                    //                     spreadRadius: 1,
                    //                     blurRadius: 10,
                    //
                    //                   ),
                    //                 ],
                    //               ),
                    //
                    //             ),
                    //           ),
                    //                const SizedBox(width: 30,),
                    //
                    //
                    //                   Badge(
                    //                    badgeContent: Text(
                    //                        "$_counter"
                    //                        ),
                    //                    child: Container(
                    //                      height: 75,
                    //                      width: 75,
                    //                      child: const Padding(
                    //                        padding: EdgeInsets.only(top:15,left: 10),
                    //                        child:  Text("Customer Order Verified"
                    //                          , style: TextStyle(fontWeight: FontWeight.bold),
                    //                        ),
                    //                      ),
                    //                      decoration: BoxDecoration(
                    //                        color: Colors.grey.shade300,
                    //                        borderRadius: BorderRadius.circular(22),
                    //                        boxShadow: [
                    //                          BoxShadow(
                    //                              color: Colors.grey.shade500,
                    //                              offset: const Offset(-4,-4),
                    //                              spreadRadius: 1,
                    //                            blurRadius: 10,
                    //
                    //                          ),
                    //                        ],
                    //                      ),
                    //
                    //                    ),
                    //
                    //                  ),
                    //
                    //
                    //           const SizedBox(width: 30,),
                    //           Badge(
                    //             badgeContent: Text(
                    //                 "$_counter"
                    //             ),
                    //             child: Container(
                    //               height: 75,
                    //               width: 75,
                    //               child: const Padding(
                    //                 padding: EdgeInsets.only(top:20,left: 10),
                    //                 child: const Text("Pending Order"
                    //                   , style: const TextStyle(fontWeight: FontWeight.bold),
                    //                 ),
                    //               ),
                    //               decoration: BoxDecoration(
                    //                 color: Colors.grey.shade300,
                    //                 borderRadius: BorderRadius.circular(22),
                    //                 boxShadow: [
                    //                   BoxShadow(
                    //                     color: Colors.grey.shade500,
                    //                     offset: const Offset(-4,-4),
                    //                     spreadRadius: 1,
                    //                     blurRadius: 10,
                    //
                    //                   ),
                    //                 ],
                    //               ),
                    //
                    //             ),
                    //           ),
                    //         ],
                    //
                    //       ),
                    //       const SizedBox(height: 25,),
                    //       Row(
                    //         children: [
                    //           Container(
                    //             height: 75,
                    //             width: 75,
                    //             child: const Padding(
                    //               padding: EdgeInsets.only(top:20,left: 10),
                    //               child: const Text("Xyz"
                    //                 , style: TextStyle(fontWeight: FontWeight.bold),
                    //               ),
                    //             ),
                    //             decoration: BoxDecoration(
                    //               color: Colors.grey.shade300,
                    //               borderRadius: BorderRadius.circular(22),
                    //               boxShadow: [
                    //                 BoxShadow(
                    //                   color: Colors.grey.shade500,
                    //                   offset: const Offset(-4,-4),
                    //                   spreadRadius: 1,
                    //                   blurRadius: 10,
                    //
                    //                 ),
                    //               ],
                    //             ),
                    //
                    //           ),
                    //           const SizedBox(width: 30,),
                    //           Container(
                    //             height: 75,
                    //             width: 75,
                    //             child: const Padding(
                    //               padding: EdgeInsets.only(top:20,left: 10),
                    //               child: Text("ABC"
                    //                 , style: TextStyle(fontWeight: FontWeight.bold),
                    //               ),
                    //             ),
                    //             decoration: BoxDecoration(
                    //               color: Colors.grey.shade300,
                    //               borderRadius: BorderRadius.circular(22),
                    //               boxShadow: [
                    //                 BoxShadow(
                    //                   color: Colors.grey.shade500,
                    //                   offset: const Offset(-4,-4),
                    //                   spreadRadius: 1,
                    //                   blurRadius: 10,
                    //
                    //                 ),
                    //               ],
                    //             ),
                    //
                    //           ),
                    //           const SizedBox(width: 30,),
                    //           Container(
                    //             height: 75,
                    //             width: 75,
                    //             child: const Padding(
                    //               padding: EdgeInsets.only(top:20,left: 10),
                    //               child: const Text("xYZ"
                    //                 , style: TextStyle(fontWeight: FontWeight.bold),
                    //               ),
                    //             ),
                    //             decoration: BoxDecoration(
                    //               color: Colors.grey.shade300,
                    //               borderRadius: BorderRadius.circular(22),
                    //               boxShadow: [
                    //                 BoxShadow(
                    //                   color: Colors.grey.shade500,
                    //                   offset: const Offset(-4,-4),
                    //                   spreadRadius: 1,
                    //                   blurRadius: 10,
                    //
                    //                 ),
                    //               ],
                    //             ),
                    //
                    //           ),
                    //         ],
                    //
                    //       ),
                    //
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   height: 200,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(.0),
                    //     child: Table(
                    //       columnWidths: {
                    //         0 : FlexColumnWidth(3),
                    //         1 : FlexColumnWidth(1),
                    //       },
                    //       border: TableBorder(horizontalInside: BorderSide(width: 1,color: Colors.grey.withOpacity(0.5),style: BorderStyle.solid,)
                    //       ),
                    //       children: [
                    //         TableRow(
                    //             decoration: BoxDecoration(
                    //               color: Colors.grey.shade400.withOpacity(0.4),
                    //               borderRadius: BorderRadius.circular(10),
                    //             ),
                    //             children :[
                    //
                    //               Padding(
                    //                 padding: EdgeInsets.all(8.0),
                    //                 child: Text('Verified Order',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    //               ),
                    //               Padding(
                    //                 padding: EdgeInsets.all(8.0),
                    //                 child: Text('2',style: TextStyle(fontWeight: FontWeight.bold)),
                    //               ),
                    //
                    //
                    //             ]),
                    //         TableRow(
                    //             decoration: BoxDecoration(
                    //               color: Colors.grey.shade400.withOpacity(0.4),
                    //               borderRadius: BorderRadius.circular(10),
                    //             ),
                    //             children :[
                    //
                    //               Padding(
                    //                 padding: EdgeInsets.all(8.0),
                    //                 child: Text('Pending Orders',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    //               ),
                    //               Padding(
                    //                 padding: EdgeInsets.all(8.0),
                    //                 child: Text('5',style: TextStyle(fontWeight: FontWeight.bold)),
                    //               ),
                    //
                    //
                    //             ]),
                    //         TableRow(
                    //             decoration: BoxDecoration(
                    //               color: Colors.grey.shade400.withOpacity(0.4),
                    //               borderRadius: BorderRadius.circular(10),
                    //             ),
                    //             children :[
                    //
                    //               Padding(
                    //                 padding: EdgeInsets.all(8.0),
                    //                 child: Text('Verified Order',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    //               ),
                    //               Padding(
                    //                 padding: EdgeInsets.all(8.0),
                    //                 child: Text('2',style: TextStyle(fontWeight: FontWeight.bold)),
                    //               ),
                    //
                    //
                    //             ]),
                    //         TableRow(
                    //             decoration: BoxDecoration(
                    //               color: Colors.grey.shade400.withOpacity(0.4),
                    //               borderRadius: BorderRadius.circular(10),
                    //             ),
                    //             children :[
                    //
                    //               Padding(
                    //                 padding: EdgeInsets.all(8.0),
                    //                 child: Text('Pending Orders',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    //               ),
                    //               Padding(
                    //                 padding: EdgeInsets.all(8.0),
                    //                 child: Text('5',style: TextStyle(fontWeight: FontWeight.bold)),
                    //               ),
                    //
                    //
                    //             ]),
                    //       ],
                    //     ),
                    //   ),
                    //   decoration: BoxDecoration(
                    //     color: Colors.grey.shade300,
                    //     borderRadius: BorderRadius.circular(22),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.shade500,
                    //         offset: Offset(-4,-4),
                    //         spreadRadius: 1,
                    //         blurRadius: 10,
                    //
                    //       ),
                    //     ],
                    //   ),
                    //
                    // ),
                  ],

                ),

              ),

            ),

          ),
        

    );
  }
}
