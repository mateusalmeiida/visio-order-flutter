import 'package:flutter/material.dart';
import 'package:visio_order/components/app_icon.dart';
import 'package:visio_order/components/select_algorithm.dart';
import 'package:visio_order/data/colors_data.dart';
import 'package:visio_order/utils/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visio Order'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: ColorsData.colorsAlgorithm['Bubble Sort']!)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.INFO_PAGE);
              },
              icon: Icon(
                Icons.info,
                size: 30,
              ))
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(height: 20),
        AppIcon(),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
              itemCount: ColorsData.colorsAlgorithm.length,
              itemBuilder: (ctx, index) {
                final alg = ColorsData.colorsAlgorithm.keys.toList();
                return Column(
                  children: [
                    SelectAlgorithm(algorithm: alg[index]),
                    SizedBox(
                      height: 30,
                    )
                  ],
                );
              }),
        )
      ]),
    );
  }
}
