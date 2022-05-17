// import 'dart:convert';
//
// DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));
//  String dataModelToJson(DataModel data) => json.encode(data.toJson());
//
//  class DataModel{
//    DataModel({
//      this.qty,
//      this.item,
//  });
//
//    String ?qty;
//    int ?item;
//
//    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
//      qty: json['qty'],
//      item: json['item'],
//    );
//
//    Map<String, dynamic> toJson()=> {
//      'qty' : qty,
//      "item": item,
//    };
//
//  }