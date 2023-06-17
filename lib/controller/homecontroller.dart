import 'dart:convert';
import 'package:apiintegrationflutter/model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';

// getUserList() async {
//   var url = 'https://jsonplaceholder.typicode.com/users';
//   var urlUpdate = Uri.parse(url);
//   var response = await http.get(urlUpdate);
//   var res = jsonDecode(response.body);
//   print(res);
//   return res;
// }

getUserList() async {
  var userData = [];
  var url = '${Constants.baseUrl}/users';
  var urlUpdate = Uri.parse(url);
  var response = await http.get(urlUpdate);
  var res = jsonDecode(response.body);
  for (var item in res) {
    userData.add(user.fromJson(item));
  }
  print(res);
  return userData;
}

addPost(data) async {
  String url = '${Constants.baseUrl}/posts';
  var baseURL = Uri.parse(url);
  final response = await http.post(
    baseURL,
    body: jsonEncode(data),
    headers: {'content-type': 'application/json'},
  );
  print(response.body);
  return response;
}
