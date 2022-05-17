import 'dart:convert';
import 'package:easycare/Customer/customer_API.dart';
import 'package:flutter/material.dart';

class Customer extends StatefulWidget {
  const Customer({Key? key}) : super(key: key);

  @override
  State<Customer> createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  CustomerServices dataServices = CustomerServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
          child: FutureBuilder(
            future: dataServices.fetchCustomerFromUrl(),
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                try {
                  final snapshotData = jsonDecode(snapshot.data)[0];

                  //  final id = snapshotData["id"];
                  final firstName = snapshotData['first_name'];
                  final address = snapshotData["address"];
                  // final subDomain = snapshotData['sub_domain'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //   Text("Id is -> $id"),
                      Text("Branch is -> $firstName"),
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
