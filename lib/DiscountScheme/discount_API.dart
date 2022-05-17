import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

class DiscountServices {
  Future fetchDiscountApiFromUrl() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final response = await http.get(
        Uri.parse(
            "https://api-soori-ims-staging.dipendranath.com.np/api/v1/purchase-app/discount-scheme-list"),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
        });
    List<String> respond = [];
    respond.add('Select Discount');
    for (var i = 0; i < json.decode(response.body)['results'].length; i++) {
      respond.add(
          "${json.decode(response.body)['results'][i]['name']} - ${json.decode(response.body)['results'][i]['rate']}");
    }
    if (response.statusCode == 200) {
      return respond;
    }
  }
}

// String baseUrl = "https://api-soori-ims-staging.dipendranath.com.np/";
// Future<List<Branches>> fetchBranch() async {
//   var apiUrl = "api/v1/branches";
//   http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
//   try {
//     if (res.statusCode == 200) {
//       List<dynamic> list = json.decode(res.body);
//       return list.map((e) => Branches.fromJson(e)).toList();
//     } else {
//       return <Branches>[];
//     }
//   } catch (e) {
//     return <Branches>[];
//   }
// }

// Future fetchBranch() async {
//   log("Fetching data");
//   final response = await http.get(Uri.parse(
//       'https://api-soori-ims-staging.dipendranath.com.np/api/v1/branches'));
//   log(response.body);

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.

//     return Branches.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load customer');
//   }
// }
