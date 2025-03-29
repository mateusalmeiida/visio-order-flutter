import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visio_order/data/colors_data.dart';

class ItemsVector extends StatefulWidget {
  final String algorithm;
  final double opacity;
  final IconData iconData;
  final int index;
  final int value;
  final int length;
  const ItemsVector({
    required this.iconData,
    required this.opacity,
    required this.index,
    required this.length,
    required this.value,
    required this.algorithm,
    super.key,
  });

  @override
  State<ItemsVector> createState() => ItemsVectorState();
}

class ItemsVectorState extends State<ItemsVector> {
  late Color colorIcon;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double sizeContainer = (screenWidth / widget.length) > 100
        ? 100
        : (screenWidth / widget.length);
    if (widget.iconData == FontAwesomeIcons.solidCircleUp) {
      colorIcon = Colors.green;
    } else if (widget.iconData == FontAwesomeIcons.solidCircleDown) {
      colorIcon = Colors.red;
    } else {
      colorIcon = Colors.amber;
    }

    return Column(
      children: [
        AnimatedOpacity(
          opacity: widget.opacity,
          duration: Duration(milliseconds: 500),
          child: SizedBox(
            height: 0.4 * sizeContainer,
            width: sizeContainer,
            child: Center(
              child: Icon(
                widget.iconData,
                color: colorIcon,
                size: sizeContainer * 0.3,
              ),
            ),
          ),
        ),
        Container(
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
                colors: ColorsData.colorsAlgorithm[widget.algorithm] ??
                    [Colors.blue]),
          ),
          child: FittedBox(
            child: Text(
              widget.value.toString().padLeft(2, '0'),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
