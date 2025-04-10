import 'package:flutter/material.dart';
import 'package:visio_order/components/items_merge_sort.dart';
import 'package:visio_order/components/items_vector.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visio_order/pages/preview_page.dart';

class Vector extends StatefulWidget {
  final List<int> vector;
  final List<int> mergeList;
  final String algorithm;
  final double speed;
  final StateAnimation state;
  const Vector({
    required this.mergeList,
    required this.state,
    required this.speed,
    required this.vector,
    required this.algorithm,
    super.key,
  });

  @override
  State<Vector> createState() => VectorState();
}

class VectorState extends State<Vector> with SingleTickerProviderStateMixin {
  late AnimationController _horizontalController;
  late List<Animation<double>> _animationsHorizontal;
  List<int> indexAnimateHorizontal = [];
  late List<IconData> icons;
  late List<IconData> iconsMerge;
  late List<double> opacity;
  late List<double> opacityIconsMerge;
  late List<double> opacityContainer;
  Map<int, bool> _hiddenIndices = {};
  late List<double> selectIndexOpacity;
  late List<double> selectIndexOpacityMerge;
  late List<Color> borderColor;
  late List<Color> borderColorMerge;
  late List<List<Color>> colorsSelectItem;
  late List<List<Color>> colorsSelectItemMerge;

  @override
  void didUpdateWidget(Vector oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.speed != widget.speed) {
      _horizontalController.duration =
          Duration(milliseconds: (600 / widget.speed).toInt());
    }

    if (oldWidget.vector != widget.vector) {
      generateAnimation();
    }

    opacityIconsMerge = List.generate(widget.mergeList.length, (_) => 0.0);
    borderColorMerge =
        List.generate(widget.mergeList.length, (_) => Colors.white);
    iconsMerge = List.generate(widget.vector.length, (_) {
      return FontAwesomeIcons.equals;
    });
    selectIndexOpacityMerge = List.generate(widget.vector.length, (_) {
      return 0.0;
    });
    colorsSelectItemMerge = List.generate(widget.vector.length, (_) {
      return [Colors.purpleAccent[200]!, Colors.purple];
    });

    final newLength = widget.mergeList.length;

    // Remove estados de índices que não existem mais
    _hiddenIndices.removeWhere((index, _) => index >= newLength);

    // Adiciona novos índices que ainda não existiam
    for (int i = 0; i < newLength; i++) {
      _hiddenIndices.putIfAbsent(i, () => false);
    }
  }

  @override
  void initState() {
    super.initState();

    _horizontalController = AnimationController(
      duration: Duration(milliseconds: (600 / widget.speed).toInt()),
      vsync: this,
    );

    _horizontalController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          if (indexAnimateHorizontal.length == 2) {
            int temp = widget.vector[indexAnimateHorizontal[0]];
            widget.vector[indexAnimateHorizontal[0]] =
                widget.vector[indexAnimateHorizontal[1]];
            widget.vector[indexAnimateHorizontal[1]] = temp;
          }
        });

        _horizontalController.reset();
        indexAnimateHorizontal.clear();
      }
    });

    /*_verticalController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _verticalController.reset();
        indexAnimateVertical.clear(); // opcional, dependendo do seu controle
      }
    });*/

    icons = List.generate(widget.vector.length, (_) {
      return FontAwesomeIcons.equals;
    });
    iconsMerge = List.generate(widget.vector.length, (_) {
      return FontAwesomeIcons.equals;
    });
    opacity = List.generate(widget.vector.length, (_) {
      return 0.0;
    });
    opacityIconsMerge = List.generate(widget.mergeList.length, (_) {
      return 0.0;
    });
    opacityContainer = List.generate(widget.vector.length, (_) {
      return 1.0;
    });
    for (int i = 0; i < widget.mergeList.length; i++) {
      _hiddenIndices[i] = false;
    }
    selectIndexOpacity = List.generate(widget.vector.length, (_) {
      return 0.0;
    });
    selectIndexOpacityMerge = List.generate(widget.vector.length, (_) {
      return 0.0;
    });
    borderColor = List.generate(widget.vector.length, (_) {
      return Colors.white;
    });
    borderColorMerge = List.generate(widget.mergeList.length, (_) {
      return Colors.white;
    });
    colorsSelectItem = List.generate(widget.vector.length, (_) {
      return [Colors.purpleAccent[200]!, Colors.purple];
    });
    colorsSelectItemMerge = List.generate(widget.vector.length, (_) {
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

  Future<void> selectLeftmark(int index) async {
    if (index < 0 || index >= widget.vector.length) {
      return;
    }
    setState(() {
      colorsSelectItem[index] = [Colors.red[200]!, Colors.red];
      selectIndexOpacity[index] = 1.0;
    });
    await delay(200);
  }

  Future<void> selectRightAndLeft(int left, int right) async {
    if (left < 0 ||
        left >= widget.vector.length ||
        right < 0 ||
        right >= widget.vector.length) {
      return;
    }
    setState(() {
      colorsSelectItem[right] = [Colors.blue[200]!, Colors.blueAccent];
      selectIndexOpacity[right] = 1.0;
      colorsSelectItem[left] = [Colors.red[200]!, Colors.red];
      selectIndexOpacity[left] = 1.0;
    });
    await delay(200);
  }

  Future<void> selectRightmark(int index) async {
    if (index < 0 || index >= widget.vector.length) {
      return;
    }
    setState(() {
      colorsSelectItem[index] = [Colors.blue[200]!, Colors.blueAccent];
      selectIndexOpacity[index] = 1.0;
    });
    await delay(200);
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

  void hideContainerMerge(int index) {
    if (index < 0 || index >= widget.mergeList.length) {
      return;
    }
    setState(() {
      _hiddenIndices[index] = true;
    });
  }

  void showAllContainersMerge() {
    setState(() {
      _hiddenIndices.updateAll((key, value) => false);
    });
  }

  void changeIconMerge(int index, int index2, int value, int value2) {
    if (index < 0 ||
        index >= widget.mergeList.length ||
        index2 < 0 ||
        index2 >= widget.mergeList.length) {
      return;
    }
    if (value > value2) {
      iconsMerge[index] = FontAwesomeIcons.solidCircleUp;
      iconsMerge[index2] = FontAwesomeIcons.solidCircleDown;
    } else if (value2 > value) {
      iconsMerge[index2] = FontAwesomeIcons.solidCircleUp;
      iconsMerge[index] = FontAwesomeIcons.solidCircleDown;
    } else {
      iconsMerge[index2] = FontAwesomeIcons.equals;
      iconsMerge[index] = FontAwesomeIcons.equals;
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

  Future<void> mergeSelectIndex(List<int> indexs) async {
    for (var index in indexs) {
      if (index < 0 || index >= widget.vector.length) {
        return;
      }
      setState(() {
        opacityContainer[index] = 0.0;
      });
    }
    await delay(500);
  }

  Future<void> mergeUnselectIndex(List<int> indexs) async {
    for (var index in indexs) {
      if (index < 0 || index >= widget.vector.length) {
        return;
      }
      setState(() {
        opacityContainer[index] = 1.0;
      });
    }
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

  Future<void> selectPivo(int pivo, int leftmark, int rightmark) async {
    if (pivo < 0 ||
        pivo >= widget.vector.length ||
        leftmark < 0 ||
        leftmark >= widget.vector.length ||
        rightmark < 0 ||
        rightmark >= widget.vector.length) {
      return;
    }
    setState(() {
      colorsSelectItem[rightmark] = [Colors.blue[200]!, Colors.blueAccent];
      colorsSelectItem[leftmark] = [Colors.red[200]!, Colors.red];
      borderColor[pivo] = Colors.yellowAccent;
      selectIndexOpacity[rightmark] = 1.0;
      selectIndexOpacity[leftmark] = 1.0;
    });
    await Future.delayed(Duration(milliseconds: (500 / widget.speed).toInt()));
  }

  Future<void> comparePivo(int pivo, int index2) async {
    if (pivo < 0 ||
        pivo >= widget.vector.length ||
        index2 < 0 ||
        index2 >= widget.vector.length) {
      return;
    }
    setState(() {
      borderColor[index2] = Colors.cyanAccent;
    });
    await Future.delayed(Duration(milliseconds: (500 / widget.speed).toInt()));
    setState(() {
      opacity[pivo] = 1;
      opacity[index2] = 1;
    });
    await Future.delayed(Duration(milliseconds: (500 / widget.speed).toInt()));
    setState(() {
      opacity[pivo] = 0;
      opacity[index2] = 0;
      borderColor[index2] = Colors.white;
    });
    await Future.delayed(Duration(milliseconds: (200 / widget.speed).toInt()));
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
    await Future.delayed(Duration(milliseconds: (300 / widget.speed).toInt()));
  }

  Future<void> compareContainersMerge(int index, int index2) async {
    if (index < 0 ||
        index >= widget.mergeList.length ||
        index2 < 0 ||
        index2 >= widget.mergeList.length) {
      return;
    }
    setState(() {
      borderColorMerge[index] = Colors.cyanAccent;
      borderColorMerge[index2] = Colors.cyanAccent;
    });
    await Future.delayed(Duration(milliseconds: (500 / widget.speed).toInt()));
    setState(() {
      opacityIconsMerge[index] = 1;
      opacityIconsMerge[index2] = 1;
    });
    await Future.delayed(Duration(milliseconds: (500 / widget.speed).toInt()));
    setState(() {
      opacityIconsMerge[index] = 0;
      opacityIconsMerge[index2] = 0;
      borderColorMerge[index] = Colors.white;
      borderColorMerge[index2] = Colors.white;
    });
    await Future.delayed(Duration(milliseconds: (300 / widget.speed).toInt()));
  }

  void generateAnimation() {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double sizeContainer = (screenWidth / widget.vector.length) > 100
        ? 100
        : (screenWidth / widget.vector.length);

    _animationsHorizontal = List.generate(widget.vector.length, (index) {
      double begin = 0.0;
      double end = 0.0;

      if (indexAnimateHorizontal.contains(index)) {
        int def = indexAnimateHorizontal[1] - indexAnimateHorizontal[0];
        if (index == indexAnimateHorizontal[0]) {
          end = sizeContainer * def;
        } else if (index == indexAnimateHorizontal[1]) {
          end = -sizeContainer * def;
        }
      }

      return Tween<double>(begin: begin, end: end).animate(
          CurvedAnimation(parent: _horizontalController, curve: Curves.linear));
    });
  }

  Future<void> swapContainer(int index1, int index2) async {
    indexAnimateHorizontal.clear();
    indexAnimateHorizontal.add(index1);
    indexAnimateHorizontal.add(index2);
    generateAnimation();
    _horizontalController.forward();
    await Future.delayed(Duration(milliseconds: (850 / widget.speed).toInt()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    generateAnimation();
  }

  @override
  void dispose() {
    _horizontalController.dispose();
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
    final int midMerge = (0 + widget.mergeList.length - 1) ~/ 2;

    return Column(
      children: [
        SizedBox(
          width: sizeContainer * widget.vector.length,
          height: sizeContainer * 1.7,
          child: Stack(
            children: widget.vector.asMap().entries.map((entry) {
              int index = entry.key;
              return AnimatedBuilder(
                  animation: _horizontalController,
                  builder: (context, child) {
                    double positionLeft = _animationsHorizontal[index].value;
                    return Positioned(
                      left: positionLeft + (index * sizeContainer),
                      child: ItemsVector(
                        opacityContainer: opacityContainer[index],
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
        ),
        if (widget.algorithm == 'Merge Sort' &&
            widget.state == StateAnimation.running)
          SizedBox(
            width: sizeContainer * widget.mergeList.length,
            height: sizeContainer * 1.7,
            child: Stack(
              children: widget.mergeList.asMap().entries.map((entry) {
                int index = entry.key;
                return Positioned(
                  left: index * sizeContainer,
                  child: ItemsMergeSort(
                    opacityContainerMerge:
                        _hiddenIndices[index] == true ? 0.0 : 1.0,
                    value: entry.value,
                    colorsSelectItem: colorsSelectItemMerge[index],
                    borderColor: borderColorMerge[index],
                    speed: widget.speed,
                    opacityIconsMerge: opacityIconsMerge[index],
                    selectIndexOpacity: selectIndexOpacityMerge[index],
                    colors: index <= midMerge
                        ? [Colors.grey[300]!, Colors.grey]
                        : [Color(0xFFE6D3B3), Color(0xFFD2B48C)],
                    iconData: iconsMerge[index],
                    length: widget.vector.length,
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
