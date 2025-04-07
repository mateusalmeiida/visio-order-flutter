import 'package:flutter/material.dart';
import 'package:visio_order/components/items_vector.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Vector extends StatefulWidget {
  final List<int> vector;
  final String algorithm;
  final double speed;
  const Vector({
    required this.speed,
    required this.vector,
    required this.algorithm,
    super.key,
  });

  @override
  State<Vector> createState() => VectorState();
}

class VectorState extends State<Vector> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;
  List<int> indexAnimate = [];
  late List<IconData> icons;
  late List<double> opacity;
  late List<double> selectIndexOpacity;
  late List<Color> borderColor;
  late List<List<Color>> colorsSelectItem;

  @override
  void didUpdateWidget(Vector oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.speed != widget.speed) {
      _controller.duration =
          Duration(milliseconds: (600 / widget.speed).toInt());
    }

    if (oldWidget.vector != widget.vector) {
      generateAnimation();
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: (600 / widget.speed).toInt()),
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

    icons = List.generate(widget.vector.length, (_) {
      return FontAwesomeIcons.equals;
    });
    opacity = List.generate(widget.vector.length, (_) {
      return 0.0;
    });
    selectIndexOpacity = List.generate(widget.vector.length, (_) {
      return 0.0;
    });
    borderColor = List.generate(widget.vector.length, (_) {
      return Colors.white;
    });
    colorsSelectItem = List.generate(widget.vector.length, (_) {
      return [Colors.purpleAccent[200]!, Colors.purple];
    });
  }

  void resetColor() {
    if (borderColor.isEmpty) return;
    for (int i = 0; i < borderColor.length; i++) {
      borderColor[i] = Colors.white;
    }
    setState(() {});
  }

  void changeColorSelectItem(int index) {
    if (index < 0 || index >= widget.vector.length) {
      return;
    }
    setState(() {
      colorsSelectItem[index] = [Colors.red[200]!, Colors.red];
    });
  }

  void changeIcon(int index, int index2, int value, int value2) {
    if (index < 0 ||
        index >= widget.vector.length ||
        index2 < 0 ||
        index2 >= widget.vector.length) {
      return;
    }
    if (value > value2) {
      icons[index] = FontAwesomeIcons.solidCircleUp;
      icons[index2] = FontAwesomeIcons.solidCircleDown;
    } else if (value2 > value) {
      icons[index2] = FontAwesomeIcons.solidCircleUp;
      icons[index] = FontAwesomeIcons.solidCircleDown;
    } else {
      icons[index2] = FontAwesomeIcons.equals;
      icons[index] = FontAwesomeIcons.equals;
    }
  }

  void indexSelected(int index) {
    if (index < 0 || index >= widget.vector.length) {
      return;
    }
    setState(() {
      selectIndexOpacity[index] = 1.0;
    });
  }

  void indexUncheck(int index) {
    if (index < 0 || index >= widget.vector.length) {
      return;
    }
    setState(() {
      selectIndexOpacity[index] = 0.0;
    });
  }

  void setOrdered(int index) {
    if (index < 0 || index >= widget.vector.length) {
      return;
    }
    setState(() {
      borderColor[index] = Colors.lightGreenAccent;
    });
  }

  Future<void> compareContainers(int index, int index2) async {
    if (index < 0 ||
        index >= widget.vector.length ||
        index2 < 0 ||
        index2 >= widget.vector.length) {
      return;
    }
    setState(() {
      borderColor[index] = Colors.cyanAccent;
      borderColor[index2] = Colors.cyanAccent;
    });
    await Future.delayed(Duration(milliseconds: (500 / widget.speed).toInt()));
    setState(() {
      opacity[index] = 1;
      opacity[index2] = 1;
    });
    await Future.delayed(Duration(milliseconds: (500 / widget.speed).toInt()));
    setState(() {
      opacity[index] = 0;
      opacity[index2] = 0;
      borderColor[index] = Colors.white;
      borderColor[index2] = Colors.white;
    });
    await Future.delayed(Duration(milliseconds: (200 / widget.speed).toInt()));
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

  void startAnimation() async {
    _controller.forward();
  }

  Future<void> swapContainer(int index1, int index2) async {
    indexAnimate.clear();
    indexAnimate.add(index1);
    indexAnimate.add(index2);
    generateAnimation();
    startAnimation();
    await Future.delayed(Duration(milliseconds: (850 / widget.speed).toInt()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    generateAnimation();
  }

  /*@override
  void didUpdateWidget(Vector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.vector != widget.vector) {
      generateAnimation();
    }
  }*/

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> delay(int duration) async {
    await Future.delayed(
        Duration(milliseconds: (duration / widget.speed).toInt()));
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double sizeContainer = (screenWidth / widget.vector.length) > 100
        ? 100
        : (screenWidth / widget.vector.length);

    return SizedBox(
      width: sizeContainer * widget.vector.length,
      height: sizeContainer * 1.7,
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
                    colorsSelectItem: colorsSelectItem[index],
                    selectIndexOpacity: selectIndexOpacity[index],
                    speed: widget.speed,
                    borderColor: borderColor[index],
                    //index: index,
                    length: widget.vector.length,
                    value: entry.value,
                    algorithm: widget.algorithm,
                    opacity: opacity[index],
                    iconData: icons[index],
                  ),
                );
              });
        }).toList(),
      ),
    );
  }
}
