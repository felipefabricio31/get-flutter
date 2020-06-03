import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/controllers/estados_controller.dart';

class EstadosTab extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<EstadosController>(
        init: EstadosController(),
        initState: (_) {
          EstadosController.to.getTodosEstados();
        },
        builder: (_) {
          if (_.model == null) {
            return CircularProgressIndicator();
          } else {
            return Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: _.model.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.map),
                    title: Text("${_.model.data[index].uid}"),
                    subtitle: Text("${_.model.data[index].uid}"),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
