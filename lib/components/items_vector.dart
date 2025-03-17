import 'package:flutter/material.dart';
import 'package:visio_order/data/colors_data.dart';

class ItemsVector extends StatelessWidget {
  final String algorithm;
  final int value;
  final int length;
  const ItemsVector(
      {required this.length,
      required this.value,
      required this.algorithm,
      super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double sizeContainer = screenWidth / length;
    final double margin = sizeContainer > 100 ? 100 : sizeContainer;
    return Container(
      margin: EdgeInsets.only(top: margin, bottom: margin),
      child: Container(
        constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
        padding: EdgeInsets.all(5),
        height: sizeContainer,
        width: sizeContainer,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: ColorsData.colorsAlgorithm[algorithm] ?? [Colors.blue]),
        ),
        child: FittedBox(
          child: Text(
            value.toString().padLeft(2, '0'),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
