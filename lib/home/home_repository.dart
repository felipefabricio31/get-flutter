import 'package:dio/dio.dart';
import 'package:get_flutter/home/home_model.dart';

class Api {
  Future<ApiModel> fetchData() async {
    try {
      final response = await Dio().get("https://api.covid19api.com/summary");
      return ApiModel.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
