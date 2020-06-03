import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/controllers/covid_controller.dart';

class EstadosTab extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<CovidController>(
        init: CovidController(),
        initState: (_) {
          CovidController.to.getTodosEstados();
        },
        builder: (_) {
          if (_.model == null) {
            return CircularProgressIndicator();
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(2),
                    color: Colors.white,
                    child: DataTable(
                      sortAscending: _.sort,
                      sortColumnIndex: 2,
                      columns: [
                        DataColumn(
                          label: Text(
                            'Estado',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
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
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
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
                            'Mortes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.black,
                            ),
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
                            (item) => DataRow(
                              cells: [
                                DataCell(
                                  Text(item.uf),
                                  onTap: () {},
                                ),
                                DataCell(
                                  Text(
                                    item.cases.toString(),
                                  ),
                                  onTap: () {},
                                ),
                                DataCell(
                                  Text(
                                    item.deaths.toString(),
                                  ),
                                  onTap: () {
                                    print(item.deaths.toString());
                                  },
                                ),
                              ],
                            ),
                          )
                          .toList(),
                      dataRowHeight: 40,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
