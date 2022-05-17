import 'dart:convert';


import 'package:easycare/Add%20Products/api.dart';
import 'package:flutter/material.dart';

class TestDemo extends StatefulWidget {
  const TestDemo({Key? key}) : super(key: key);

  @override
  State<TestDemo> createState() => _TestDemoState();
}

class _TestDemoState extends State<TestDemo> {
  // late Future<Branches> branches;
  // @override
  // void initState() {
  //   super.initState();
  //   branches = fetchBranch();
  //   // print(branches);
  // }

  DataServices dataServices = DataServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
          child: FutureBuilder(
            future: dataServices.fetchApiFromUrl(),
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                try {
                  final snapshotData = jsonDecode(snapshot.data)[0];

                //  final id = snapshotData["id"];
                  final branch = snapshotData['name'];
                //  final schemaName = snapshotData["schema_name"];
                 // final subDomain = snapshotData['sub_domain'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   //   Text("Id is -> $id"),
                      Text("Branch is -> $branch"),
                     // Text("Schema is -> $schemaName"),
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
