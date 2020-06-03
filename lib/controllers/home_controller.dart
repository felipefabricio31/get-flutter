import 'package:get/get.dart';
import 'package:get_flutter/models/home_model.dart';
import 'package:get_flutter/repository/home_repository.dart';

class Controller extends GetController {
  static Controller get to => Get.find();
  ApiModel data;

  int index = 0;

  menu(int tab) {
    index = tab;
    update(this);
  }

  void fetchDataApi() async {
    Api api = Api();

    final response = await api.fetchData();
    if (response == null) {
      Get.snackbar("Erro", "Não foi possivel conectar ao servidor.");
    } else {
      data = response;
      update(this);
    }
  }
}
