import 'package:flutter/material.dart';
import 'package:visio_order/data/colors_data.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double sideContainer;

    if (screenWidth <= 400) {
      sideContainer = 20;
    } else if (screenWidth <= 600) {
      sideContainer = 22;
    } else if (screenWidth <= 800) {
      sideContainer = 23;
    } else {
      sideContainer = 25;
    }

    return Column(
      children: [
        Container(
          height: sideContainer,
          width: sideContainer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: ColorsData.colorsAlgorithm['Insertion Sort']!,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: sideContainer),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 2, right: 2),
                height: sideContainer,
                width: sideContainer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: ColorsData.colorsAlgorithm['Bubble Sort']!,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2, right: 2),
                height: sideContainer,
                width: sideContainer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: ColorsData.colorsAlgorithm['Merge Sort']!,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2, right: 2),
                height: sideContainer,
                width: sideContainer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: ColorsData.colorsAlgorithm['Quick Sort']!,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2, right: 2),
                height: sideContainer,
                width: sideContainer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: ColorsData.colorsAlgorithm['Selection Sort']!,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
