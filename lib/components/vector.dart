import 'package:flutter/material.dart';
import 'package:visio_order/components/items_vector.dart';

class Vector extends StatefulWidget {
  final List<int> vector;
  final String algorithm;
  const Vector({required this.vector, required this.algorithm, super.key});

  @override
  State<Vector> createState() => VectorState();
}

class VectorState extends State<Vector> {
  late List<int> positions;

  @override
  void initState() {
    super.initState();
    print('Vector inicializado');
    positions = List.generate(widget.vector.length, (i) => i);
  }

  void reinitializePositions() {
    print('Positions reinicializado');
    print(widget.vector);
    print(positions);
    positions.clear();
    for (int i = 0; i < widget.vector.length; i++) {
      positions.add(i);
    }
  }

  void swapContainer(int index1, int index2) {
    positions[index1]++;
    positions[index2]--;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.vector);
    print(positions);
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
            reSwap: reinitializePositions,
            index: positions[entry.key],
            length: widget.vector.length,
            algorithm: widget.algorithm,
            value: entry.value,
          );
        }).toList(),
      ),
    );
  }
}
