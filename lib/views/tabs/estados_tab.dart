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
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Estado',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text(
                      'Confirmados',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text(
                      'Mortes',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    numeric: false,
                  ),
                ],
                rows: _.model.data
                    .map(
                      (item) => DataRow(cells: [
                        DataCell(
                          Text(item.uf),
                          onTap: () {
                            // write your code..
                          },
                        ),
                        DataCell(
                          Text(item.cases.toString()),
                        ),
                        DataCell(
                          Text(item.deaths.toString()),
                        ),
                      ]),
                    )
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
