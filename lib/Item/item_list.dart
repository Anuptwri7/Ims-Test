import 'package:flutter/foundation.dart';

class Item {
  // int? id;
  String? name;
  //String? address;
  // String ?subDomain;
  // bool ?active;

  Item(
      {
        // required this.id,
        required this.name,
        //required this.address,
        //  required this.subDomain,
        // required this.active
      }
      ) ;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      // id: json['id'],
      name: json['name'],
     // address: json['address'],
      //  subDomain: json['subDomain'],
      // active: json['active'],
    );
  }

}
