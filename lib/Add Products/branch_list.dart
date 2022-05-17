import 'package:flutter/foundation.dart';

class Branches {
 // int id;
 // String name;
 String schemaName;
  //String subDomain;
 // bool active;

  Branches(
      {//required this.id,
     // required this.name,
      required this.schemaName,
     // required this.subDomain,
     // required this.active
  }
  );

  factory Branches.fromJson(Map<String, dynamic> json) {
    return Branches(
     // id: json['id'],
    //  name: json['name'],
     schemaName: json['schemaName'],
    //  subDomain: json['subDomain'],
     // active: json['active'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['schema_name'] = this.schemaName;
  //   data['sub_domain'] = this.subDomain;
  //   data['active'] = this.active;
  //   return data;
  // }
}
