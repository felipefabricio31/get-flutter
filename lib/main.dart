import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: "/",
    namedRoutes: {
      '/': GetRoute(page: MyHomePage()),
      '/second': GetRoute(page: Second()),
    },
  ));
}

class Controller extends GetController {
  static Controller get to => Get.find();
  int counter = 0;

  void incrementCounter() {
    counter++;
    update(this);
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("CONSTRUIDO");

    return Scaffold(
      appBar: AppBar(
        title: Text("Introdução ao GET"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Seu contador',
            ),
            GetBuilder<Controller>(
                init: Controller(),
                builder: (_) {
                  return Text(
                    '${_.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute.of(context))......
                // Get.to(Second());
                Get.toNamed(
                  '/second',
                  arguments: 'argumentos da primeira tela',
                );
              },
              child: Text("Próxima tela"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Controller.to.incrementCounter(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Second"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("${Controller.to.counter}"),
            Text("${Get.arguments}"),
          ],
        ),
      ),
    );
  }
}
