import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:tablas_andy/pages/tablas/tabla.dart';
import 'package:tablas_andy/pages/widgets/menuBox.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> tablas = [
      ['Tabla del', Icons.filter_2, '2'],
      ['Tabla del', Icons.filter_3, '3'],
      ['Tabla del', Icons.filter_4, '4'],
      ['Tabla del', Icons.filter_5, '5'],
      ['Tabla del', Icons.filter_6, '6'],
      ['Tabla del', Icons.filter_7, '7'],
      ['Tabla del', Icons.filter_8, '8'],
      ['Tabla del', Icons.filter_9, '9'],
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Tablas Andy')),
      ),
      body: GridView.custom(
        gridDelegate: SliverStairedGridDelegate(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          pattern: const [
            StairedGridTile(0.5, 5 / 1),
            StairedGridTile(0.5, 5 / 1),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: tablas.length,
          (context, index) => MenuBox(
            title: tablas[index][0],
            icon: tablas[index][1],
            funcion: () {
              Get.off(Tabla(
                tabla: tablas[index][2],
              ));
            },
          ),
        ),
      ),
    );
  }
}
