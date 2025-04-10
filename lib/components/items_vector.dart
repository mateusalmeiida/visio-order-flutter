import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visio_order/data/colors_data.dart';

class ItemsVector extends StatefulWidget {
  final String algorithm;
  final double opacity;
  final double opacityContainer;
  final IconData iconData;
  final Color borderColor;
  final double selectIndexOpacity;
  final List<Color> colorsSelectItem;
  //final int index;
  final int value;
  final int length;
  final double speed;
  const ItemsVector({
    required this.opacityContainer,
    required this.colorsSelectItem,
    required this.speed,
    required this.borderColor,
    required this.iconData,
    required this.selectIndexOpacity,
    required this.opacity,
    //required this.index,
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
          duration: Duration(milliseconds: (500 / widget.speed).toInt()),
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
        SizedBox(
          height: sizeContainer,
          width: sizeContainer,
          child: AnimatedOpacity(
            opacity: widget.opacityContainer,
            duration: Duration(milliseconds: (500 / widget.speed).toInt()),
            child: AnimatedContainer(
              duration: Duration(milliseconds: (500 / widget.speed).toInt()),
              decoration: BoxDecoration(
                border: Border.all(color: widget.borderColor, width: 2),
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: ColorsData.colorsAlgorithm[widget.algorithm] ??
                        [Colors.blue]),
              ),
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: (500 / widget.speed).toInt()),
                style: TextStyle(
                  color: widget.borderColor,
                  fontWeight: FontWeight.bold,
                ),
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      widget.value.toString().padLeft(2, '0'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 0.2 * sizeContainer,
          width: sizeContainer,
          child: Center(
            child: SizedBox(
              height: 0.08 * sizeContainer,
              width: sizeContainer * 0.95,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: (200 / widget.speed).toInt()),
                opacity: widget.selectIndexOpacity,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: widget.colorsSelectItem),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
