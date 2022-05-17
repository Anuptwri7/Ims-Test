import 'dart:developer';

import 'package:easycare/model/branch_list.dart';
import "package:http/http.dart" as http;

class DataServices {
  static String baseUrl = "https://api-soori-ims-staging.dipendranath.com.np/";
  static Future<List<BranchList>> fetchBranch() async {
    var apiUrl = "api/v1/branches";
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    log(res.body);
    try {
      if (res.statusCode == 200) {
        final List<BranchList> branch = branchListFromJson(res.body);
        return branch;
      } else {
        return <BranchList>[];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
