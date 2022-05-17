import 'dart:convert';

import 'package:easycare/Customer/customer_API.dart';
import 'package:easycare/SaveCustomerOrder/save_API.dart';
import 'package:easycare/SaveCustomerOrder/save_list.dart';
import 'package:flutter/material.dart';

class Save extends StatefulWidget {
  const Save({Key? key}) : super(key: key);

  @override
  _SaveState createState() => _SaveState();
}

class _SaveState extends State<Save> {

 CustomerorderServices customerorderServices = CustomerorderServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
          child: FutureBuilder(
           // future: CustomerorderServices.create(),
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                try {
                  final snapshotData = jsonDecode(snapshot.data)[0];

                  //  final id = snapshotData["id"];
                  final first_name = snapshotData['first_name'];
                  final address = snapshotData["address"];
                  // final subDomain = snapshotData['sub_domain'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //   Text("Id is -> $id"),
                      Text("Branch is -> $first_name"),
                      Text("Schema is -> $address"),
                      // Text("Subdomain is -> $subDomain"),
                    ],
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
    );
  }
}
