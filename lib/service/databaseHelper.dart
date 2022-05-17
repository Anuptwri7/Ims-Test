// import 'dart:developer';

// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class DatabaseHelper {
//   String serverUrl = "https://api-soori-ims-staging.dipendranath.com.np/api/v1";
//   var status;

//   var tokens;

//   loginData(String name, String password) async {
//     String myUrl = "$serverUrl/user-app/login";
//     final response = await http.post(Uri.parse(myUrl),
//         headers: {'Accept': 'application/json'},
//         body: {"email": "$name", "password": "$password"});

//     log("Fetching tokens");
//     log(response.body);
//     status = response.body.contains('error');

//     var data = json.decode(response.body);

//     if (status) {
//       print('data : ${data["error"]}');
//     } else {
//       // print('data : ${data["tokens"]['access']}');
//       _save(data["tokens"]);
//     }
//   }

//   registerData(String name, String email, String password) async {
//     String myUrl = "$serverUrl/register1";
//     final response = await http.post(Uri.parse(myUrl),
//         headers: {'Accept': 'application/json'},
//         body: {"name": "$name", "email": "$email", "password": "$password"});
//     status = response.body.contains('error');

//     var data = json.decode(response.body);

//     if (status) {
//       print('data : ${data["error"]}');
//     } else {
//       print('data : ${data["tokens"]}');
//       _save(data["tokens"]);
//     }
//   }

//   _save(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'tokens';
//     final value = tokens;
//     prefs.setString(key, value);
//   }

//   read() async {
//     final prefs = await SharedPreferences.getInstance();
//     final key = 'tokens';
//     final value = prefs.get(key) ?? 0;

//     print('read : $value');
//   }

  // Future<List> getData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = prefs.get(key) ?? 0;

  //   String myUrl = "$serverUrl/products/";
  //   http.Response response = await http.get(Uri.parse(myUrl), headers: {
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $value'
  //   });
  //   return json.decode(response.body);
  // }

  // void deleteData(int id) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = prefs.get(key) ?? 0;

  //   String myUrl = "$serverUrl/products/$id";
  //   http.delete(myUrl, headers: {
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $value'
  //   }).then((response) {
  //     print('Response status : ${response.statusCode}');
  //     print('Response body : ${response.body}');
  //   });
  // }

  // void addData(String name, String price) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = prefs.get(key) ?? 0;

  //   String myUrl = "$serverUrl/products";
  //   http.post(myUrl, headers: {
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $value'
  //   }, body: {
  //     "name": "$name",
  //     "price": "$price"
  //   }).then((response) {
  //     print('Response status : ${response.statusCode}');
  //     print('Response body : ${response.body}');
  //   });
  // }

  // void editData(int id, String name, String price) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'token';
  //   final value = prefs.get(key) ?? 0;

  //   String myUrl = "http://flutterapitutorial.codeforiraq.org/api/products/$id";
  //   http.put(myUrl, headers: {
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $value'
  //   }, body: {
  //     "name": "$name",
  //     "price": "$price"
  //   }).then((response) {
  //     print('Response status : ${response.statusCode}');
  //     print('Response body : ${response.body}');
  //   });
  // }

// }
