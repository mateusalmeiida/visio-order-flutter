import 'package:flutter/material.dart';
import 'package:visio_order/components/items_vector.dart';

class Vector extends StatefulWidget {
  final List<int> vector;
  final String algorithm;
  const Vector({required this.vector, required this.algorithm, super.key});

  @override
  State<Vector> createState() => VectorState();
}

class VectorState extends State<Vector> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;
  List<int> indexAnimate = [];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          if (indexAnimate.length == 2) {
            int temp = widget.vector[indexAnimate[0]];
            widget.vector[indexAnimate[0]] = widget.vector[indexAnimate[1]];
            widget.vector[indexAnimate[1]] = temp;
          }
        });

        _controller.reset();
        indexAnimate.clear();
      }
    });
  }

  void generateAnimation() {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double sizeContainer = (screenWidth / widget.vector.length) > 100
        ? 100
        : (screenWidth / widget.vector.length);

    _animations = List.generate(widget.vector.length, (index) {
      double begin = 0.0;
      double end = 0.0;

      if (indexAnimate.contains(index)) {
        int def = indexAnimate[1] - indexAnimate[0];
        if (index == indexAnimate[0]) {
          end = sizeContainer * def;
        } else if (index == indexAnimate[1]) {
          end = -sizeContainer * def;
        }
      }

      return Tween<double>(begin: begin, end: end)
          .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    });
  }

  startAnimation() {
    _controller.forward();
  }

  Future<void> swapContainer(int index1, int index2) async {
    indexAnimate.clear();
    indexAnimate.add(index1);
    indexAnimate.add(index2);
    generateAnimation();
    startAnimation();
    await Future.delayed(Duration(milliseconds: 850));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    generateAnimation();
  }

  @override
  void didUpdateWidget(Vector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.vector != widget.vector) {
      generateAnimation();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          int index = entry.key;
          return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double position = _animations[index].value;
                return Positioned(
                  left: position + (index * sizeContainer),
                  child: ItemsVector(
                      index: index,
                      length: widget.vector.length,
                      value: entry.value,
                      algorithm: widget.algorithm),
                );
              });
        }).toList(),
      ),
    );
  }
}
