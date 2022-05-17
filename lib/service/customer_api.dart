import 'dart:convert';
import 'dart:developer';
import 'package:easycare/model/discount_list.dart';
import 'package:easycare/model/items_list.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerServices {
  //Customer Name

  List<String> allCustomer = ['Select One'];

  fetchPaginatedCustomer(String url, SharedPreferences sharedPreferences) async {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
    });
    if (response.statusCode == 200) {
      int resultLength = json.decode(response.body)['results'].length;
      for (var i = 0; i < resultLength; i++) {
        allCustomer.add(
            json.decode(response.body)['results'][i]['first_name'].toString());
      }
      log("Recurring"+allCustomer.length.toString());
      if (resultLength >= 10) {
        String nextUrl = json.decode(response.body)['next'];
        await fetchPaginatedCustomer(nextUrl, sharedPreferences);
      }
    }
  }

  Future fetchCustomerFromUrl(
      {String url =
          'https://api-soori-ims-staging.dipendranath.com.np/api/v1/chalan-app/customer-list'}) async {
    try {
      final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await fetchPaginatedCustomer(url, sharedPreferences);
    //  log("API final log"+allCustomer.length.toString());
      return allCustomer;
    } catch (e) {
      throw Exception(e);
    }
  }

  //Discount
  Future fetchDiscountFromUrl() async {
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
    // log("customer List ${json.decode(response.body)['results']}");
    // log("${response.statusCode}");
    try {
      if (response.statusCode == 200) {
        return response.body;
      } else {
        log("${response.statusCode}");
        return <Discount>[];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  //Items List
  Future fetchItemsFromUrl() async {
    // CustomerList? custom erList;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final response = await http.get(
        Uri.parse(
            "https://api-soori-ims-staging.dipendranath.com.np/api/v1/customer-order-app/item-list"),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${sharedPreferences.get("access_token")}'
        });
    // log("fetching items Data");
    // log("Items List ${json.decode(response.body)['results']}");
    // log("${response.statusCode}");
    // log(response.body);

    try {
      if (response.statusCode == 200) {
        return response.body;
      } else {
        log("${response.statusCode}");
        return <ItemsList>[];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
