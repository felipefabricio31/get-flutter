import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/controllers/home_controller.dart';
import 'package:get_flutter/views/tabs/estados_tab.dart';
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
              title: Text('Brasil'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              title: Text('Paises'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.gps_fixed),
              title: Text('Mapeamento'),
            )
          ],
        );
      });
}
