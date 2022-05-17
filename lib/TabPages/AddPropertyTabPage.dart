// import 'dart:convert';
// import 'dart:core';
// import 'dart:developer';
// import 'package:easycare/Branch/branch_API.dart';
// import 'package:easycare/Customer/customer_API.dart';
// import 'package:easycare/DiscountScheme/discount_API.dart';
// import 'package:easycare/Item/item_API.dart';
// import 'package:easycare/model/add_product.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class MoreTabPage extends StatefulWidget {
//   const MoreTabPage({Key? key}) : super(key: key);
//
//   @override
//   _MoreTabPageState createState() => _MoreTabPageState();
// }
//
// class _MoreTabPageState extends State<MoreTabPage> {
//
//  // int value= 2;
//   String dropdownValueDiscount = "Select Discount";
//   String dropdownValueItem = "Select Item";
//   String dropdownValue = 'Select Name';
//   String dropdownValueBranch = 'Select Branch';
//   CustomerServices customerServices = CustomerServices();
//   BranchServices branchServices = BranchServices();
//   ItemServices itemServices = ItemServices();
//   DiscountServices discountServices = DiscountServices();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: ElevatedButton(
//               onPressed: () async {
//                 await AddProd();
//               },
//                 child:Text("hit me"),
//             )
//           ),
//         ),
//       ),
//     );
//   }
//   // final add =
//   Future<dynamic> AddProd() async {
//     final SharedPreferences sharedPreferences =
//     await SharedPreferences.getInstance();
//
//
//     final response = await http.post(Uri.parse("https://api-soori-ims-staging.dipendranath.com.np/api/v1/customer-order-app/save-customer-order"),
//         headers: {
//         'Content-Type': 'application/json',
//         // 'Accept': 'application/json',
//       'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
//     }, body:json.encode(
//             {
//               "status": 1,
//               "customer":4,
//               "sub_total": 900,
//               "total_discount": 0,
//               "total_tax": 0,
//               "grand_total": 900,
//               "remarks": "",
//               "order_details":[
//                 {
//                   "item": 30,
//                   "item_category": 4,
//                   "taxable": "false",
//                   "discountable": "true",
//                   "qty": 3,
//                   "purchase_cost": 0,
//                   "sale_cost": 300,
//                   "discount_rate": 0,
//                   "discount_amount": 0,
//                   "tax_rate": 0,
//                   "tax_amount": 0,
//                   "gross_amount": 300,
//                   "net_amount": 300,
//                   "remarks": "",
//                   "isNew": "true",
//                   "unique": "2ed54673-a7b4-489f-91a2-98abe79241ee",
//                   "cancelled": "false"
//                 }],
//
//               "total_discountable_amount": 900,
//               "total_taxable_amount": 0,
//               "total_non_taxable_amount": 900,
//               "discount_scheme": '',
//               "discount_rate": 0,
//               "delivery_location": "",
//               "delivery_date_ad": "",
//
//             }
//         )
//
//         );
//     if(kDebugMode){
//        // log(add.toString());
//      log('hello${response.body}');
//     }
//     //log();
//
//
//     if (response.statusCode == 200) {
//       // final String responseString = response.body;
//
//       return response;
//       return response.body;
//
//       // return AddProductList.fromJson(responseString);
//     }
//     //  return response;
//   }
//
// }

import 'dart:convert';
import 'dart:developer';

import 'package:easycare/model/items_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../service/customer_api.dart';
import 'package:easycare/Customer/customer_list.dart';
import '../../model/discount_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'addModel.dart';

TextEditingController firstName = TextEditingController();
TextEditingController discountName = TextEditingController();
TextEditingController discountRate = TextEditingController();
TextEditingController middleName = TextEditingController();
TextEditingController lastName = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController contactNumber = TextEditingController();
TextEditingController PanNumber = TextEditingController();

class AddPropertyTabPage extends StatefulWidget {
  const AddPropertyTabPage({Key? key}) : super(key: key);

  @override
  _AddPropetyTabPageState createState() => _AddPropetyTabPageState();
}

class _AddPropetyTabPageState extends State<AddPropertyTabPage> {
  final qtycontroller = TextEditingController();
  TextEditingController salespricecontroller = TextEditingController();
  TextEditingController remarkscontroller = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController discountPercentageController = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  List<AddModel> allModelData = [];

  int gross_amnt = 0,
      qty = 0,
      sales_cost = 0,
      gross = 0,
      Net = 0,
      discPercentage = 0,
      grand = 0,
      discountAmt = 0;

  calculation() {
    setState(() {
      //discPercentage = int.parse(discountPercentage.text);
      qty = int.parse(qtycontroller.text);
      discPercentage = int.parse(discountPercentageController.text);
      sales_cost = int.parse(pricecontroller.text);
      gross_amnt = qty * sales_cost;
      discountAmt = (discPercentage * gross_amnt) ~/ 100;
      grand = gross_amnt - discountAmt;
      Net = gross_amnt - discountAmt;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    qtyController.dispose();
    super.dispose();
  }
  DateTime? picked;
  CustomerServices customerServices = CustomerServices();
  String initialData = 'Select One';
  int selectedId = 0;
  String discountInitial = "10.00";
  int discountId = 0;
  String dropdownItems = "Select Items";
  int itemId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeff3ff),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-1.0, -0.94),
                    end: Alignment(0.968, 1.0),
                    colors: [Color(0xff2c51a4), Color(0xff6b88e8)],
                    stops: [0.0, 1.0],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                    bottomRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                  //   color: Color(0xff2557D2)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: const Center(
                    child: Text(
                      'Customer Order',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    // color: Colors.amber,
                    height: 50,
                    width: 290,

                    margin: EdgeInsets.only(left:20,right: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border:Border.all(color:Color(0xff2C51A4).withOpacity(0.8) ) ,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(4, 4),
                          )
                        ]),
                    padding: const EdgeInsets.only(left:10, right:0),
                    child: FutureBuilder(
                      future: customerServices.fetchCustomerFromUrl(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          try {
                            final List<String> snapshotData = snapshot.data;
                            customerServices.allCustomer = [];
                            log("snapshotData"+snapshotData.length.toString());
                            return DropdownButton<String>(
                              icon: const Icon(Icons.arrow_downward,
                                  color: Colors.white),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.white,
                              ),
                              value: initialData,
                              onChanged: (String? newValue) {
                                setState(() {
                                  initialData = newValue.toString();
                                  selectedId = snapshotData.indexOf(newValue!);
                                  log('sending id ::: $selectedId');
                                });
                              },
                              items: snapshotData
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            );
                          } catch (e) {
                            throw Exception(e);
                          }
                        }

                        else {
                          return Text(snapshot.error.toString());
                        }
                      },
                    ),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () => OpenDialog(context),
                      child: CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          child: Icon(Icons.add)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(

                        margin: EdgeInsets.only(left:0,right:10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border:Border.all(color:Color(0xff2C51A4).withOpacity(0.8) ) ,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(4, 4),
                              )
                            ]),
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: FutureBuilder(
                          future: customerServices.fetchDiscountFromUrl(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              try {
                                final snapshotData = json.decode(snapshot.data);
                                Discount discount =
                                    Discount.fromJson(snapshotData);

                                // List<String> select = ['Select Discount'];
                                // List<double> discount1 = [];
                                // List<int> ids = [];

                                List<String> firstname = [];
                                for (var i = 0;
                                    i < discount.results!.length;
                                    i++) {
                                  firstname.add(
                                      discount.results![i].rate.toString());
                                  // firstname = select + discount1;
                                }
                                log(firstname.toString());
                                return DropdownButton<String>(
                                  icon: const Icon(Icons.arrow_downward,
                                      color: Colors.white),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.white,
                                  ),
                                  value: discountInitial,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      log('Data is ${firstname.indexOf(newValue!)}');

                                      discountInitial = newValue.toString();

                                      // selectedId = firstname.indexOf(newValue);
                                    });
                                  },
                                  items: firstname
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Container(
                      child: GestureDetector(
                        onTap: () => OpenDialogDiscount(context),
                        child: CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            child: Icon(Icons.add)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 40.0),
                  child: Container(
                    height: 50,
                    width: 300,

                    //margin: EdgeInsets.only(left:10,right:60),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border:Border.all(color:Color(0xff2C51A4).withOpacity(0.8) ) ,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(4, 4),
                          )
                        ]),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: FutureBuilder(
                      future: customerServices.fetchItemsFromUrl(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          try {
                            final snapshotData = json.decode(snapshot.data);
                            // log("Items $snapshotData");
                            ItemsList itemModel =
                                ItemsList.fromJson(snapshotData);

                            // log("The Output is ${itemModel.runtimeType}");

                            List<String> items = ['Select Items'];
                            List<String> itemsList1 = [];

                            List<String> itemList = [];
                            for (var i = 0;
                                i < itemModel.results!.length;
                                i++) {
                              CircularProgressIndicator();
                              itemsList1
                                  .add(itemModel.results![i].name.toString());
                              // ids.add(testModel.results![i].id ?? 0);
                              itemList = items + itemsList1;
                            }
                            // log("list of items");
                            // log(itemList.toString());
                            return DropdownButton<String>(
                              icon: const Icon(Icons.arrow_downward,
                                  color: Colors.white),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.white,
                              ),
                              value: dropdownItems,
                              onChanged: (String? newValue) {
                                log('Data is ${itemList.indexOf(newValue!)}');
                                setState(() {
                                  dropdownItems = newValue.toString();
                                });
                              },
                              items: itemList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
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
                ),
              ),
              // Container(
              //   // color: Colors.amber,
              //   height: 30,
              //   padding: const EdgeInsets.only(left: 0, right: 120),
              //   child: FutureBuilder(
              //     future: customerServices.fetchDiscountFromUrl(),
              //     builder:
              //         (BuildContext context, AsyncSnapshot snapshot) {
              //       if (snapshot.hasData) {
              //         try {
              //           final snapshotData = json.decode(snapshot.data);
              //           Discount discount =
              //           Discount.fromJson(snapshotData);
              //
              //           // List<String> select = ['Select Discount'];
              //           // List<double> discount1 = [];
              //           // List<int> ids = [];
              //
              //           List<String> firstname = [];
              //           for (var i = 0;
              //           i < discount.results!.length;
              //           i++) {
              //             firstname.add(
              //                 discount.results![i].rate.toString());
              //             // firstname = select + discount1;
              //           }
              //           log(firstname.toString());
              //           return DropdownButton<String>(
              //             icon: const Icon(Icons.arrow_downward),
              //             elevation: 16,
              //             style:
              //             const TextStyle(color: Colors.deepPurple),
              //             underline: Container(
              //               height: 2,
              //               color: Colors.deepPurpleAccent,
              //             ),
              //             value: discountInitial,
              //             onChanged: (String? newValue) {
              //               setState(() {
              //                 log('Data is ${firstname.indexOf(newValue!)}');
              //
              //                 discountInitial = newValue.toString();
              //
              //                 // selectedId = firstname.indexOf(newValue);
              //               });
              //             },
              //             items: firstname
              //                 .map<DropdownMenuItem<String>>(
              //                     (String value) {
              //                   return DropdownMenuItem<String>(
              //                     value: value,
              //                     child: Text(value),
              //                   );
              //                 }).toList(),
              //           );
              //         } catch (e) {
              //           throw Exception(e);
              //         }
              //       } else {
              //         return Text(snapshot.error.toString());
              //       }
              //     },
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   height: 50,
              //   width: 320,
              //   padding: EdgeInsets.only(left:10,right: 45),
              //   child: const TextField(
              //
              //     // controller: passwordtextEditingController,
              //     decoration: InputDecoration(
              //
              //       filled: true,
              //       fillColor: Colors.white,
              //       hintText: 'Customer Name',
              //       border: InputBorder. none,
              //       focusedBorder: InputBorder. none,
              //       enabledBorder: InputBorder. none,
              //       errorBorder: InputBorder. none,
              //       hintStyle: TextStyle(
              //           fontSize: 14,
              //           color: Colors.grey,
              //           fontWeight: FontWeight.bold
              //
              //
              //       ),
              //
              //       contentPadding: EdgeInsets.all(15),
              //
              //     ),
              //
              //   ),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       // border:Border.all(color:Color(0xff2C51A4).withOpacity(0.8) ) ,
              //       borderRadius: BorderRadius.circular(15),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.grey,
              //           spreadRadius: 1,
              //           blurRadius: 2,
              //           offset: Offset(4, 4),
              //         )
              //       ]
              //   ),
              // ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Sales Price"),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 45,
                          width: 165,
                          child: TextField(
                            controller: pricecontroller,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.white)),

                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Sales Price',
                              // border: InputBorder. none,
                              // focusedBorder: InputBorder. none,
                              // enabledBorder: InputBorder. none,
                              // errorBorder: InputBorder. none,
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),

                              contentPadding: EdgeInsets.all(15),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // border:Border.all(color:Color(0xff2C51A4).withOpacity(0.8) ) ,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(4, 4),
                                )
                              ]),
                        ),
                      ],
                    ), ///// Sales price

                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Delivery Location"),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 45,
                          width: 165,
                          child: TextField(
                            controller: locationController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.white)),

                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Delivery location',
                              // border: InputBorder. none,
                              // focusedBorder: InputBorder. none,
                              // enabledBorder: InputBorder. none,
                              // errorBorder: InputBorder. none,
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),

                              contentPadding: EdgeInsets.all(15),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // border:Border.all(color:Color(0xff2C51A4).withOpacity(0.8) ) ,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(4, 4),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Quantity"),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 45,
                          width: 165,
                          child: TextField(
                            controller: qtycontroller,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.white)),

                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Quantity',
                              // border: InputBorder. none,
                              // focusedBorder: InputBorder. none,
                              // enabledBorder: InputBorder. none,
                              // errorBorder: InputBorder. none,
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),

                              contentPadding: EdgeInsets.all(15),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // border:Border.all(color:Color(0xff2C51A4).withOpacity(0.8) ) ,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(4, 4),
                                )
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Item Name"),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 45,
                          width: 165,
                          child: TextField(
                            //controller: qtycontroller,

                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.white)),

                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Item Name',
                              // border: InputBorder. none,
                              // focusedBorder: InputBorder. none,
                              // enabledBorder: InputBorder. none,
                              // errorBorder: InputBorder. none,
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),

                              contentPadding: EdgeInsets.all(15),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // border:Border.all(color:Color(0xff2C51A4).withOpacity(0.8) ) ,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(4, 4),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Discount %"),
                        const SizedBox(
                          height: 8,
                        ),


                        Container(
                          height: 45,
                          width: 165,
                          child: TextField(
                            controller: discountPercentageController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.white)),

                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Discount %',
                              // border: InputBorder. none,
                              // focusedBorder: InputBorder. none,
                              // enabledBorder: InputBorder. none,
                              // errorBorder: InputBorder. none,
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),

                              contentPadding: EdgeInsets.all(15),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // border:Border.all(color:Color(0xff2C51A4).withOpacity(0.8) ) ,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(4, 4),
                                )
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Delivery Date"),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 45,
                          width: 165,
                          child: InkWell(
                            onTap: () {
                              _pickDateDialog();
                            },
                            child: TextField(
                              controller: dateController,
                              // keyboardType: TextInputType.text,
                              enabled: false,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Delivery Date',
                                border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                    BorderSide(color: Colors.white)),
                                // focusedBorder: InputBorder. none,
                                // enabledBorder: InputBorder. none,
                                // errorBorder: InputBorder. none,
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),

                                contentPadding: EdgeInsets.all(15),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // border:Border.all(color:Colors.white.withOpacity(0.8) ) ,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(4, 4),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 35,
                width: 320,
                //color: Colors.grey,
                padding: const EdgeInsets.only(left: 120, right: 120),
                child: ElevatedButton(
                  onPressed: () async {
                    calculation();
                    // dateController.clear();
                    //  pricecontroller.clear();

                    //  qtycontroller.clear();
                    //  discountPercentageController.clear();
                    allModelData.add(AddModel(
                        name: dropdownItems,
                        quantity: qty,
                        amount: gross_amnt));

                    log('new Add Model' + allModelData.toString());

                    //AddProduct1();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff6b88e8)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //  side: BorderSide(color: Colors.red)
                        ),
                      )),
                  child: const Text(
                    "Add",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              // Container(
              //   child: Column(
              //     children: [
              //       Text(
              //         'sales cost :$sales_cost',
              //         style: TextStyle(fontSize: 14),
              //       ),
              //       Text(
              //         'gross :$gross_amnt',
              //         style: TextStyle(fontSize: 14),
              //       ),
              //       Text(
              //         'net:$Net',
              //         style: TextStyle(fontSize: 14),
              //       ),
              //       Text(
              //         'discount amount:$discountAmt',
              //         style: TextStyle(fontSize: 14),
              //       ),
              //       Text(
              //         'subtotal :$gross_amnt',
              //         style: TextStyle(fontSize: 14),
              //       ),
              //       Text(
              //         'grand total :$grand',
              //         style: TextStyle(fontSize: 14),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.only(left: 10, right: 10),
              //   child: Column(
              //     children: [
              //       Container(
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Table(
              //               columnWidths: const {
              //                 0: FlexColumnWidth(3),
              //                 1: FlexColumnWidth(1),
              //                 2: FlexColumnWidth(1),
              //                 3: FlexColumnWidth(1.5),
              //               },
              //               border: TableBorder(
              //                   horizontalInside: BorderSide(
              //                       width: 1,
              //                       color: Colors.grey.withOpacity(0.5),
              //                       style: BorderStyle.solid)),
              //               children: const [
              //                 TableRow(
              //                     decoration: BoxDecoration(
              //                       color: Colors.grey,
              //                     ),
              //                     children: [
              //                       Padding(
              //                         padding: EdgeInsets.all(8.0),
              //                         child: Text(
              //                           'Sales Cost',
              //                           style: TextStyle(
              //                               fontWeight: FontWeight.bold,
              //                               fontSize: 15),
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: EdgeInsets.all(8.0),
              //                         child: Text('Qty',
              //                             style: TextStyle(
              //                                 fontWeight:
              //                                 FontWeight.bold)),
              //                       ),
              //                       Padding(
              //                         padding: EdgeInsets.all(8.0),
              //                         child: Text('Net',
              //                             style: TextStyle(
              //                                 fontWeight:
              //                                 FontWeight.bold)),
              //                       ),
              //                       Padding(
              //                         padding: EdgeInsets.all(8.0),
              //                         child: Text('Subtotal',
              //                             style: TextStyle(
              //                                 fontWeight:
              //                                 FontWeight.bold)),
              //                       ),
              //                     ]),
              //                 TableRow(children: [
              //                   Padding(
              //                     padding: EdgeInsets.all(8.0),
              //                     child: Text(
              //                       'hj'
              //                     ),
              //                   ),
              //                   Padding(
              //                     padding: EdgeInsets.all(8.0),
              //                     child: Text('2'),
              //                   ),
              //                   Padding(
              //                     padding: EdgeInsets.all(8.0),
              //                     child: Text('3'),
              //                   ),
              //                   Padding(
              //                     padding: EdgeInsets.all(8.0),
              //                     child: Text('43'),
              //                   )
              //                 ]),
              //
              //               ]),
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 10,
              //       ),
              //       Container(
              //         height: 40,
              //         padding: const EdgeInsets.only(left: 250),
              //         child: TextField(
              //             controller: pricecontroller,
              //             keyboardType: TextInputType.number,
              //             obscureText: true,
              //             style: const TextStyle(
              //               color: Colors.white,
              //             ),
              //             decoration: const InputDecoration(
              //               border: OutlineInputBorder(
              //                   borderSide:
              //                   BorderSide(color: Colors.red)),
              //               hintText: "Rs. 856461",
              //               hintStyle: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.bold),
              //             )),
              //       ),
              //       Container(
              //         padding: const EdgeInsets.only(left: 250),
              //         child: const Text(
              //           "Grand Total",
              //           style: TextStyle(fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //       Container(
              //         padding:
              //         const EdgeInsets.only(left: 120, right: 120),
              //         child: ElevatedButton(
              //           onPressed: () async {
              //             //  validateForm();
              //             await AddProduct1( );
              //             await AddProduct1();
              //           },
              //           style: ElevatedButton.styleFrom(
              //             primary: Colors.red.withOpacity(0.7),
              //             minimumSize: const Size.fromHeight(45),
              //             maximumSize: const Size.fromHeight(50),
              //           ),
              //           child: const Text(
              //             "Save",
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 18,
              //             ),
              //           ),
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 15.0,
              //       )
              //     ],
              //   ),
              // ),

              SizedBox(
                height: 25,
              ),
              // Container(
              //   padding: EdgeInsets.all(8.0),
              //   child: Row(
              //     children:[
              //       SizedBox(width: 15,),
              //       Column(
              //         children: [
              //           Text('Date',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              //           Text('${dateController.text}'),
              //         ],
              //       ),
              //       SizedBox(width: 15,),
              //       Column(
              //         children: [
              //           Text('Sales Cost',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              //           Text('$sales_cost'),
              //         ],
              //       ),
              //       SizedBox(width: 15,),
              //       Column(
              //         children: [
              //           Text('Quantity',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              //           Text('$qty'),
              //         ],
              //       ),
              //       SizedBox(width: 15,),
              //       Column(
              //         children: [
              //           Text('Discount',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              //           Text('$discountAmt'),
              //         ],
              //       ),
              //       SizedBox(width: 15,),
              //       Column(
              //         children: [
              //           Text('Gross',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              //           Text('$gross_amnt'),
              //         ],
              //       ),
              //
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.all(8.0),
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           Text("Sub Total",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              //           SizedBox(width: 20,),
              //           Text('$gross_amnt'),
              //         ],
              //       ),
              //       Row(
              //         children: [
              //           Text("Discount %",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              //           SizedBox(width: 20,),
              //           Text('$discPercentage%'),
              //         ],
              //       ),
              //       Row(
              //         children: [
              //           Text("Net Amount",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              //           SizedBox(width: 20,),
              //           Text('$Net'),
              //         ],
              //       ),
              //       Row(
              //         children: [
              //           Text("Total Raxable amount",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              //           SizedBox(width: 20,),
              //           Text('$gross_amnt'),
              //         ],
              //
              //       ),
              //       Row(
              //         children: [
              //           Text("Grand Total",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              //           SizedBox(width: 20,),
              //           Text('$grand'),
              //         ],
              //
              //       ),
              //
              //
              //     ],
              //   ),
              // ),
              DataTable(
                columns: [
                  DataColumn(label: Text("SN")),
                  DataColumn(label: Text("Name")),
                  DataColumn(label: Text("Quantity")),
                  DataColumn(label: Text("Amount")),
                ],
                rows: [
                  for (int i = 0; i < allModelData.length; i++)
                    DataRow(cells: [
                      DataCell(Text(i.toString())),
                      DataCell(Text("${allModelData[i].name}")),
                      DataCell(Text("${allModelData[i].quantity}")),
                      DataCell(Text("${allModelData[i].amount}")),
                    ])
                ],
              ),
              Container(
                height: 35,
                width: 320,
                //color: Colors.grey,
                padding: const EdgeInsets.only(left: 120, right: 120),
                child: ElevatedButton(
                  onPressed: () async {
                    AddProduct1();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff2658D3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //  side: BorderSide(color: Colors.red)
                        ),
                      )),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _pickDateDialog() async {
    picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(
          const Duration(days: 0),
        ),
        lastDate: DateTime(2030),
        helpText: "Select Delivered Date");
    if (picked != null) {
      setState(() {
        dateController.text = '${picked!.year}-${picked!.month}-${picked!.day}';
      });
    }
  }

  Future AddProduct1() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final response = await http.post(
        Uri.parse(
            "https://api-soori-ims-staging.dipendranath.com.np/api/v1/customer-order-app/save-customer-order"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
        },
        body: json.encode(
            {
          "status": 1,
          "customer": selectedId,
          "sub_total": gross_amnt,
          "total_discount": discountAmt,
          "total_tax": 0,
          "grand_total": grand,
          "remarks": "",
         // for (var i=1;i<=12;i++)
          "order_details": [
            {
              "item": 32,
              "item_category": 8,
              "taxable": "false",
              "discountable": "true",
              "qty": qtycontroller.text,
              "purchase_cost": 0,
              "sale_cost": pricecontroller.text,
              "discount_rate": discountPercentageController.text,
              "discount_amount": discountAmt,
              "tax_rate": 0,
              "tax_amount": 0,
              "gross_amount": gross_amnt,
              "net_amount": Net,
              "remarks": "",
              "isNew": "true",
              "unique": "2ed54673-a7b4-489f-91a2-98abe79241ee",
              "cancelled": "false"
            },
            {
              "item": 32,
              "item_category": 8,
              "taxable": "false",
              "discountable": "true",
              "qty": qtycontroller.text,
              "purchase_cost": 0,
              "sale_cost": pricecontroller.text,
              "discount_rate": discountPercentageController.text,
              "discount_amount": discountAmt,
              "tax_rate": 0,
              "tax_amount": 0,
              "gross_amount": gross_amnt,
              "net_amount": Net,
              "remarks": "",
              "isNew": "true",
              "unique": "2ed54673-a7b4-489f-91a2-98abe79241ee",
              "cancelled": "false"
            },
            {
              "item": 32,
              "item_category": 8,
              "taxable": "false",
              "discountable": "true",
              "qty": qtycontroller.text,
              "purchase_cost": 0,
              "sale_cost": pricecontroller.text,
              "discount_rate": discountPercentageController.text,
              "discount_amount": discountAmt,
              "tax_rate": 0,
              "tax_amount": 0,
              "gross_amount": gross_amnt,
              "net_amount": Net,
              "remarks": "",
              "isNew": "true",
              "unique": "2ed54673-a7b4-489f-91a2-98abe79241ee",
              "cancelled": "false"
            },

          ],
          "total_discountable_amount": gross_amnt,
          "total_taxable_amount": 0,
          "total_non_taxable_amount": grand,
          "discount_scheme": '',
          "discount_rate": 0,
          "delivery_location": locationController.text,
          "delivery_date_ad": dateController.text,
        }
        ));
    if (kDebugMode) {
      // log(add.toString());
      log('hello${response.body}');
    }
    //log();
    return response;

    if (response.statusCode == 200) {
      // final String responseString = response.body;

      return response;
      return response.body;

      // return AddProductList.fromJson(responseString);
    }
    //  return response;
  }
}

Future OpenDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              margin: EdgeInsets.only(left: 220),
              child: GestureDetector(
                child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey.shade100,
                    child: Icon(Icons.close, color: Colors.red, size: 16)),
                onTap: () => Navigator.pop(context, true),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 160),
              child: (Text(
                'New Customer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 260,
                    child: TextField(
                      controller: firstName,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'First Name',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.white)),
                        // focusedBorder: InputBorder. none,
                        // enabledBorder: InputBorder. none,
                        // errorBorder: InputBorder. none,
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),

                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border:Border.all(color:Colors.white.withOpacity(0.8) ) ,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(4, 4),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 125,
                    child: TextField(
                      controller: middleName,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Middle Name',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.white)),
                        // focusedBorder: InputBorder. none,
                        // enabledBorder: InputBorder. none,
                        // errorBorder: InputBorder. none,
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),

                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border:Border.all(color:Colors.white.withOpacity(0.8) ) ,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(4, 4),
                          )
                        ]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 45,
                    width: 125,
                    child: TextField(
                      controller: lastName,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Last Name',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.white)),
                        // focusedBorder: InputBorder. none,
                        // enabledBorder: InputBorder. none,
                        // errorBorder: InputBorder. none,
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),

                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border:Border.all(color:Colors.white.withOpacity(0.8) ) ,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(4, 4),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 260,
                    child: TextField(
                      controller: address,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Address',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.white)),
                        // focusedBorder: InputBorder. none,
                        // enabledBorder: InputBorder. none,
                        // errorBorder: InputBorder. none,
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),

                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border:Border.all(color:Colors.white.withOpacity(0.8) ) ,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(4, 4),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 125,
                    child: TextField(
                      controller: contactNumber,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Contact No.',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.white)),
                        // focusedBorder: InputBorder. none,
                        // enabledBorder: InputBorder. none,
                        // errorBorder: InputBorder. none,
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),

                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border:Border.all(color:Colors.white.withOpacity(0.8) ) ,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(4, 4),
                          )
                        ]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 45,
                    width: 125,
                    child: TextField(
                      controller: PanNumber,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Pan No.',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        // focusedBorder: InputBorder. none,
                        //enabledBorder: InputBorder.none,
                        // errorBorder: InputBorder. none,
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),

                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border:Border.all(color:Colors.white.withOpacity(0.8) ) ,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(4, 4),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 35,
              width: 130,
              //color: Colors.grey,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () async {
                  createCustomer();
                  // calculation();
                  // dateController.clear();
                  //  pricecontroller.clear();

                  //  qtycontroller.clear();
                  //  discountPercentageController.clear();

                  //AddProduct1();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff2658D3)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        //  side: BorderSide(color: Colors.red)
                      ),
                    )),
                child: const Text(
                  "Add",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );

Future createCustomer() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  final response = await http.post(
      Uri.parse(
          "https://api-soori-ims-staging.dipendranath.com.np/api/v1/customer-app/customer"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
      },
      body: json.encode({
        "device_type": 1,
        "app_type": 1,
        "first_name": firstName.text,
        "middle_name": middleName.text,
        "last_name": lastName.text,
        "address": address.text,
        "phone_no": contactNumber.text,
        "mobile_no": '',
        "email_id": "",
        "pan_vat_no": PanNumber.text,
        "tax_reg_system": 1,
        "active": true,
        "country": 1
      }));
  if (kDebugMode) {
    // log(add.toString());
    log('hello${response.body}');
  }
  //log();
  return response;

  if (response.statusCode == 200) {
    // final String responseString = response.body;

    return response;
    return response.body;

    // return AddProductList.fromJson(responseString);
  }
  //  return response;
}

Future OpenDialogDiscount(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              margin: EdgeInsets.only(left: 220),
              child: GestureDetector(
                child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey.shade100,
                    child: Icon(Icons.close, color: Colors.red, size: 16)),
                onTap: () => Navigator.pop(context, true),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 120),
              child: (Text(
                'New Discount Scheme',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 260,
                    child: TextField(
                      controller: discountName,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'First Name',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.white)),
                        // focusedBorder: InputBorder. none,
                        // enabledBorder: InputBorder. none,
                        // errorBorder: InputBorder. none,
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),

                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border:Border.all(color:Colors.white.withOpacity(0.8) ) ,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(4, 4),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 260,
                    child: TextField(
                      controller: discountRate,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Rate',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.white)),
                        // focusedBorder: InputBorder. none,
                        // enabledBorder: InputBorder. none,
                        // errorBorder: InputBorder. none,
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),

                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border:Border.all(color:Colors.white.withOpacity(0.8) ) ,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(4, 4),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 35,
              width: 130,
              //color: Colors.grey,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () async {
                  createDiscountScheme();
                  // calculation();
                  // discountRate.clear();
                  // discountName.clear();

                  //  qtycontroller.clear();
                  //  discountPercentageController.clear();

                  //AddProduct1();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff2658D3)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        //  side: BorderSide(color: Colors.red)
                      ),
                    )),
                child: const Text(
                  "Add",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );



Future createDiscountScheme() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  final response = await http.post(
      Uri.parse(
          "https://api-soori-ims-staging.dipendranath.com.np/api/v1/core-app/discount-scheme"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
      },
      body: json.encode({
        "device_type": 1,
        "app_type": 1,
        "name": discountName.text,
        "editable": true,
        "rate": discountRate.text,
        "active": true
      }));
  if (kDebugMode) {
    // log(add.toString());
    log('hello${response.body}');
  }
  //log();
  return response;

  if (response.statusCode == 200) {
    // final String responseString = response.body;

    return response;
    return response.body;

    // return AddProductList.fromJson(responseString);
  }
}
