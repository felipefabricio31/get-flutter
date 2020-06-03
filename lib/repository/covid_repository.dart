import 'package:dio/dio.dart';
import 'package:get_flutter/models/covid_model.dart';

class ApiCovid {
  Future<ModelCovid> getTodosEstados() async {
    try {
      final response =
          await Dio().get("https://covid19-brazil-api.now.sh/api/report/v1");
      return ModelCovid.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
