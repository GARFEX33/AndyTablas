import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:math';

import 'package:tablas_andy/pages/homePage.dart';

class CounterController extends GetxController {
  RxString texto = 'ANDY COMENZAMOS CON 5 VUELTAS'.obs;
  RxInt tabla = 0.obs;
  RxString multi = ''.obs;
  RxInt count = 0.obs;
  RxString igual = ''.obs;
  Random random = Random();
  int numberIngresado = 0;
  RxInt resultado = 0.obs;
  int tiempo = 500;

  void increment(tab) async {
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(Duration(milliseconds: tiempo * 4));
      texto.value = 'MUCHO EXITO';
      await Future.delayed(Duration(milliseconds: tiempo * 4));
      texto.value = 'TE AMAMOS';
      await Future.delayed(Duration(milliseconds: tiempo * 4));
      texto.value = 'VAMOS CON LA VUELTA $i';
      await Future.delayed(Duration(milliseconds: tiempo * 4));
      texto.value = '';

      for (int i = 1; i <= 10; i++) {
        tabla.value = int.parse(tab);
        await Future.delayed(Duration(milliseconds: tiempo));
        multi.value = ' X ';
        await Future.delayed(Duration(milliseconds: tiempo));
        count.value = i;
        await Future.delayed(Duration(milliseconds: tiempo));
        igual.value = ' = ';
        await Future.delayed(Duration(milliseconds: tiempo));
        resultado.value = tabla.value * count.value;
        await Future.delayed(Duration(milliseconds: tiempo));
        tabla.value = 0;
        multi.value = '';
        count.value = 0;
        igual.value = '';
        resultado.value = 0;
        await Future.delayed(Duration(milliseconds: tiempo));
      }
      int numeroAleatorio = random.nextInt(8) + 2;
      await Get.defaultDialog(
        barrierDismissible: false,
        title: 'VUELTA $i',
        content: Column(
          children: [
            Text('EXCELENTE ANDY VUELTA $i'),
            const Text('RESPONDE ESTA ECUACION'),
            Text('${int.parse(tab)} X $numeroAleatorio ='),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) => numberIngresado = int.parse(value),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Respuesta',
              ),
            ),
          ],
        ),
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          final respuestaAleatoria = int.parse(tab) * numeroAleatorio;

          if (numberIngresado == respuestaAleatoria) {
            Get.back();
          } else {
            Get.snackbar(
              "OHHHHHH OHHHH",
              "RESPUESTA INCORRECTA",
              icon: const Icon(
                Icons.error,
                size: 30,
                opticalSize: 30,
              ),
              backgroundColor:
                  Color(const Color.fromARGB(255, 241, 161, 161).value),
              colorText: Colors.black,
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 2),
            );
          }
        },
      );
      texto.value = 'MUY BIEN COMPLETASTE LA VUELTA $i';
    }
    texto.value = 'FELICITACIONES COMPLETASTE LAS 5 VUELTAS';
    await Future.delayed(Duration(milliseconds: tiempo * 4));
    Get.offAll(const Home());
  }
}
