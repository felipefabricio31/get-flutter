import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/models/covid_model.dart';
import 'package:get_flutter/models/paises_model.dart';
import 'package:get_flutter/repository/covid_repository.dart';

class CovidController extends GetController {
  static CovidController get to => Get.find();
  ModelCovid model;
  ModelPaises modelPaises;

  bool sort = false;

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

  void getTodosPaises() async {
    ApiCovid api = ApiCovid();

    final response = await api.getTodosPaises();
    if (response == null) {
      Get.snackbar(
        "Erro",
        "Não foi possivel conectar ao servidor.",
        duration: Duration(seconds: 4),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      modelPaises = response;
      update(this);
    }
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        model.data.sort((a, b) => a.uf.compareTo(b.uf));
        modelPaises.data.sort((a, b) => a.country.compareTo(b.country));
      } else {
        model.data.sort((a, b) => b.uf.compareTo(a.uf));
        modelPaises.data.sort((a, b) => b.country.compareTo(a.country));
      }
    } else if (columnIndex == 1) {
      if (ascending) {
        model.data.sort((a, b) => a.cases.compareTo(b.cases));
        modelPaises.data.sort((a, b) => a.country.compareTo(b.country));
      } else {
        model.data.sort((a, b) => b.cases.compareTo(a.cases));
        modelPaises.data.sort((a, b) => b.cases.compareTo(a.cases));
      }
    } else if (columnIndex == 2) {
      if (ascending) {
        model.data.sort((a, b) => a.deaths.compareTo(b.deaths));
        modelPaises.data.sort((a, b) => a.deaths.compareTo(b.deaths));
      } else {
        model.data.sort((a, b) => b.deaths.compareTo(a.deaths));
        modelPaises.data.sort((a, b) => b.deaths.compareTo(a.deaths));
      }
    }

    update(this);
  }
}
