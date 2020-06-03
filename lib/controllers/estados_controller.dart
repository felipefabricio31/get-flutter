import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/models/covid_model.dart';
import 'package:get_flutter/repository/covid_repository.dart';

class EstadosController extends GetController {
  static EstadosController get to => Get.find();
  ModelCovid model;

  void getTodosEstados() async {
    ApiCovid api = ApiCovid();

    final response = await api.getTodosEstados();
    if (response == null) {
      Get.snackbar(
        "Erro",
        "Não foi possivel conectar ao servidor.",
        duration: Duration(seconds: 4),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      model = response;
      update(this);
    }
  }
}
