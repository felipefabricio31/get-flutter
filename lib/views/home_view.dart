import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/controllers/home_controller.dart';
import 'package:get_flutter/views/tabs/estados_tab.dart';
import 'package:get_flutter/views/tabs/hoje_tab.dart';
import 'package:get_flutter/views/tabs/mundo_tab.dart';
import 'package:get_flutter/views/tabs/paises_tab.dart';

class MyHomePage extends StatelessWidget {
  //
  final List<Widget> _children = [
    EstadosTab(),
    PaisesTab(),
    MundoTab(),
  ];

  @override
  Widget build(BuildContext context) {
    print("CONSTRUIDO");

    return GetBuilder<Controller>(
        init: Controller(),
        builder: (_) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.srgbToLinearGamma(),
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text("COVID 19"),
                backgroundColor: Colors.transparent,
                elevation: 1,
                centerTitle: true,
              ),
              body: _children[_.index],
              bottomNavigationBar: itemIconOnly(),
            ),
          );
        });
  }

  Widget itemIconOnly() => GetBuilder<Controller>(
      init: Controller(),
      builder: (_) {
        return BottomNavigationBar(
          onTap: (index) {
            _.menu(index);
          },
          currentIndex: _.index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              title: Text('Estados'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              title: Text('Brasil'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              title: Text('Mundo'),
            )
          ],
        );
      });
}

class Segunda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.png"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.srgbToLinearGamma(),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Novos Casos"),
          backgroundColor: Colors.transparent,
          elevation: 1,
          centerTitle: true,
        ),
        body: Column(
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
                        'Novos casos:',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${Controller.to.data.global.newConfirmed}',
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
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(Segunda());
          },
          tooltip: 'Pesquisar',
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}
