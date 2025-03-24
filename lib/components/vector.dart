import 'package:flutter/material.dart';
import 'package:visio_order/components/items_vector.dart';

class Vector extends StatefulWidget {
  final List<int> vector;
  final String algorithm;
  const Vector({required this.vector, required this.algorithm, super.key});

  @override
  State<Vector> createState() => _VectorState();
}

class _VectorState extends State<Vector> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double sizeContainer = (screenWidth / widget.vector.length) > 100
        ? 100
        : (screenWidth / widget.vector.length);
    return SizedBox(
      width: sizeContainer * widget.vector.length,
      height: sizeContainer,
      child: Stack(
        children: widget.vector.asMap().entries.map((entry) {
          return ItemsVector(
            index: entry.key,
            length: widget.vector.length,
            algorithm: widget.algorithm,
            value: entry.value,
          );
        }).toList(),
      ),
    );
  }
}
