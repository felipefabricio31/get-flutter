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
            return SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    color: Colors.white,
                    child: DataTable(
                      sortAscending: _.sort,
                      sortColumnIndex: 2,
                      columns: [
                        DataColumn(
                          label: Text(
                            'Estado',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                          numeric: false,
                          onSort: (columnIndex, ascending) {
                            _.sort = !_.sort;
                            _.onSortColum(columnIndex, ascending);
                          },
                        ),
                        DataColumn(
                          label: Text(
                            'Confirmados',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          numeric: false,
                          onSort: (columnIndex, ascending) {
                            _.sort = !_.sort;
                            _.onSortColum(columnIndex, ascending);
                          },
                        ),
                        DataColumn(
                          label: Text(
                            'Mortes',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          numeric: false,
                          onSort: (columnIndex, ascending) {
                            _.sort = !_.sort;
                            _.onSortColum(columnIndex, ascending);
                          },
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
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
