import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablas_andy/pages/tablas/controller.dart';

class Tabla extends StatelessWidget {
  final String tabla;
  const Tabla({
    Key? key,
    required this.tabla,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterController controller = CounterController();
    controller.increment(tabla);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Tabla del $tabla')),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  controller.texto.value,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Obx(() => Text(
                  controller.tabla.value == 0
                      ? ""
                      : controller.tabla.value.toString(),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Obx(() => Text(
                  controller.multi.value,
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Obx(() => Text(
                  controller.count.value == 0
                      ? ""
                      : controller.count.toString(),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Obx(() => Text(
                  controller.igual.value,
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Obx(() => Text(
                  controller.resultado.value == 0
                      ? ""
                      : controller.resultado.toString(),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
