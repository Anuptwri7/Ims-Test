import 'dart:convert';
import 'dart:developer';

import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'customer_list.dart';

class CustomerServices {
  Future fetchCustomerFromUrl() async {
    // CustomerList? custom erList;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final response = await http.get(
        Uri.parse(
            "https://api-soori-ims-staging.dipendranath.com.np/api/v1/customer-order-app/customer-list"),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
        });
    log("${json.decode(response.body)['results']}");
    log("${response.statusCode}");

    try {
      if (response.statusCode == 200) {
        return response.body;
      } else {
        log("${response.statusCode}");
        return <CustomerList>[];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
