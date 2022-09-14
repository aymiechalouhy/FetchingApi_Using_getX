import 'dart:convert';
import 'package:get/get.dart';
import '../model/user_model_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
  UserList? userList;
  var isDataLoading = false.obs;
  getUserInfoFromApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('https://dummyapi.io/data/v1/user?limit=10')!,
          headers: {'app-id': '632081110554008161802ee3'});
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        userList = UserList.fromJson(result);
        debugPrint(userList.toString());
      } else {}
    } catch (e) {
      debugPrint("Error while getting Data $e");
    } finally {
      isDataLoading(false);
    }
  }
}
