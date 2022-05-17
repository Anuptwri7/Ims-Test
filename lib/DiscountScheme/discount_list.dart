import 'package:easycare/DiscountScheme/discount.dart';
import 'package:flutter/foundation.dart';

class Discount {
  String? name;
  String? rate;

  Discount(
      {
        // required this.id,
        required this.name,
        required this.rate,
        //  required this.subDomain,
        // required this.active
      }
      ) ;

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      // id: json['id'],
      name: json['name'],
      rate: json['rate'],
      //  subDomain: json['subDomain'],
      // active: json['active'],
    );
  }

}
