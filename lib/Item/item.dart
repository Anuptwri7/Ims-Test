import 'dart:convert';

import 'package:easycare/Item/item_API.dart';
import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {

  ItemServices itemServices = ItemServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
          child: FutureBuilder(
            future: itemServices.fetchItemApiFromUrl(),
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                try {
                  final snapshotData = jsonDecode(snapshot.data)[0];

                  //  final id = snapshotData["id"];
                  final name = snapshotData['name'];
                 // final address = snapshotData["address"];
                  // final subDomain = snapshotData['sub_domain'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //   Text("Id is -> $id"),
                      Text("Branch is -> $name"),
                    //  Text("Schema is -> $address"),
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
