import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/controllers/home_controller.dart';

class MundoTab extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: GetBuilder<Controller>(
        init: Controller(),
        initState: (_) {
          Controller.to.fetchDataApi();
        },
        builder: (_) {
          if (_.data == null) {
            return CircularProgressIndicator();
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    color: Colors.blueAccent,
                  ),
                  padding: EdgeInsets.all(30),
                  margin: EdgeInsets.all(3),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.add_alert,
                            color: Colors.white,
                            size: 45.0,
                            semanticLabel: 'Icone de confirmados',
                          ),
                          Text(
                            'Confirmados:',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${_.data.global.totalConfirmed}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    color: Colors.green,
                  ),
                  padding: EdgeInsets.all(30),
                  margin: EdgeInsets.all(3),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.tag_faces,
                            color: Colors.white,
                            size: 45.0,
                            semanticLabel: 'Icone de recuperados',
                          ),
                          Text(
                            'Recuperados:',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${_.data.global.totalRecovered}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    color: Colors.red,
                  ),
                  padding: EdgeInsets.all(30),
                  margin: EdgeInsets.all(3),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 45.0,
                            semanticLabel: 'Icone de mortes',
                          ),
                          Text(
                            'Mortes:',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${_.data.global.totalDeaths}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
