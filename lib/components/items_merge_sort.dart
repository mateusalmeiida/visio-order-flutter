import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemsMergeSort extends StatefulWidget {
  final IconData iconData;
  final int length;
  final List<Color> colors;
  final double opacityIconsMerge;
  final double opacityContainerMerge;
  final double speed;
  final Color borderColor;
  final int value;

  const ItemsMergeSort({
    super.key,
    required this.opacityContainerMerge,
    required this.value,
    required this.borderColor,
    required this.speed,
    required this.opacityIconsMerge,
    required this.colors,
    required this.iconData,
    required this.length,
  });

  @override
  State<ItemsMergeSort> createState() => _ItemsMergeSortState();
}

class _ItemsMergeSortState extends State<ItemsMergeSort> {
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
          opacity: widget.opacityIconsMerge,
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
            opacity: widget.opacityContainerMerge,
            duration: Duration(milliseconds: (500 / widget.speed).toInt()),
            child: AnimatedContainer(
              duration: Duration(milliseconds: (500 / widget.speed).toInt()),
              decoration: BoxDecoration(
                border: Border.all(color: widget.borderColor, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: widget.colors,
                  ),
                ),
                child: AnimatedDefaultTextStyle(
                  duration:
                      Duration(milliseconds: (500 / widget.speed).toInt()),
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
        ),
      ],
    );
  }
}
