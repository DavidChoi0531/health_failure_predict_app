import 'dart:convert';

import 'package:dio/dio.dart';

class DBServerAccessAPI {
  Dio dio = Dio();

  Future<Map<String, dynamic>> selectHighBPCount() async {
    Map<String, dynamic> result = {};
    String url = 'http://localhost:8080/flutter/selectHighBP.jsp';
    var response = await dio.get(url);
    var decodeData = json.decode(response.data);
    result['고혈압'] = decodeData['result1'];
    result['정상혈압'] = decodeData['result2'];
    return result;
  }

  Future<Map<String, dynamic>> selectHDAofAge() async {
    Map<String, dynamic> result = {};
    String url = 'http://localhost:8080/flutter/selectHDAofAge.jsp';
    var response = await dio.get(url);
    Map<String, dynamic> decodeData = json.decode(response.data);

    decodeData.forEach((key, value) {
      result[key] = value;
    });
    return result;
  }
}
