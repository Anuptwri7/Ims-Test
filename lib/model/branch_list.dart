// To parse this JSON data, do
//
//     final branchList = branchListFromJson(jsonString);

import 'dart:convert';

List<BranchList> branchListFromJson(String str) =>
    List<BranchList>.from(json.decode(str).map((x) => BranchList.fromJson(x)));

String branchListToJson(List<BranchList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BranchList {
  BranchList({
    this.id,
    this.name,
    this.schemaName,
    this.subDomain,
    this.active,
  });

  int? id;
  String? name;
  String? schemaName;
  String? subDomain;
  bool? active;

  factory BranchList.fromJson(Map<String, dynamic> json) => BranchList(
        id: json["id"],
        name: json["name"],
        schemaName: json["schema_name"],
        subDomain: json["sub_domain"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "schema_name": schemaName,
        "sub_domain": subDomain,
        "active": active,
      };
}



















// import 'package:flutter/foundation.dart';

// class Branches {
//   int id;
//   String name;
//   String schemaName;
//   String subDomain;
//   bool active;

//   Branches(
//       {required this.id,
//       required this.name,
//       required this.schemaName,
//       required this.subDomain,
//       required this.active});

//   factory Branches.fromJson(Map<String, dynamic> json) {
//     return Branches(
//       id: json['id'],
//       name: json['name'],
//       schemaName: json['schemaName'],
//       subDomain: json['subDomain'],
//       active: json['active'],
//     );
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   data['id'] = this.id;
//   //   data['name'] = this.name;
//   //   data['schema_name'] = this.schemaName;
//   //   data['sub_domain'] = this.subDomain;
//   //   data['active'] = this.active;
//   //   return data;
//   // }
// }


