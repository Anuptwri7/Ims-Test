import 'dart:convert';
import 'dart:developer';

import 'package:easycare/Splash/splash_screen.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreTabPage extends StatefulWidget {
  const MoreTabPage({Key? key}) : super(key: key);

  @override
  _MoreTabPageState createState() => _MoreTabPageState();
}

class _MoreTabPageState extends State<MoreTabPage> {
  TextEditingController logoutController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("welcome user"),
            TextFormField(
              controller: logoutController,
            ),
            const SizedBox(
              height: 50,
            ),
            OutlinedButton.icon(
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                final response = await http.post(
                  Uri.parse(
                      "https://api-soori-ims-staging.dipendranath.com.np/api/v1/user-app/logout"),
                  headers: {
                    'Content-type': 'application/json',
                    'Accept': 'application/json',
                    'Authorization':
                        'Bearer ${sharedPreferences.get("access_token")}'
                  },
                  body: json.encode(<String, String>{
                    'refresh':
                        sharedPreferences.get("refresh_token").toString(),
                  }),
                );
                if (response.statusCode == 200) {
                  sharedPreferences.clear();
                  // if (kDebugMode) {
                  //   log(sharedPreferences.getString('access_token').toString());
                  //   log(sharedPreferences.getString('refresh_token').toString());
                  // }
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Error while logging out!')));
                }
              },
              icon: const Icon(
                Icons.exit_to_app,
                size: 18,
              ),
              label: Text("logout"),
            )
          ],
        ),
      ),
    );
  }
}


