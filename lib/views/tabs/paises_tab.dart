import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/controllers/covid_controller.dart';

class PaisesTab extends StatelessWidget {
  const PaisesTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<CovidController>(
        init: CovidController(),
        initState: (_) {
          CovidController.to.getTodosPaises();
        },
        builder: (_) {
          if (_.modelPaises == null) {
            return CircularProgressIndicator();
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(1),
                    color: Colors.white,
                    child: DataTable(
                      sortAscending: _.sort,
                      sortColumnIndex: 2,
                      columns: [
                        DataColumn(
                          label: Container(
                            width: 30,
                            child: Text(
                              'País',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          numeric: false,
                          onSort: (columnIndex, ascending) {
                            _.sort = !_.sort;
                            _.onSortColum(columnIndex, ascending);
                          },
                        ),
                        DataColumn(
                          label: Container(
                            width: 59,
                            child: Text(
                              'Confirm.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          numeric: false,
                          onSort: (columnIndex, ascending) {
                            _.sort = !_.sort;
                            _.onSortColum(columnIndex, ascending);
                          },
                        ),
                        DataColumn(
                          label: Container(
                            width: 43,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Mortes',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          numeric: false,
                          onSort: (columnIndex, ascending) {
                            _.sort = !_.sort;
                            _.onSortColum(columnIndex, ascending);
                          },
                        ),
                      ],
                      rows: _.modelPaises.data
                          .map(
                            (item) => DataRow(
                              cells: [
                                DataCell(
                                  Container(
                                    width: 75,
                                    child: Text(item.country),
                                  ),
                                  onTap: () {},
                                ),
                                DataCell(
                                  Container(
                                    width: 50,
                                    child: Text(
                                      item.cases.toString(),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                DataCell(
                                  Container(
                                    width: 50,
                                    child: Text(
                                      item.deaths.toString(),
                                    ),
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
