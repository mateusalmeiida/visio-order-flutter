import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:visio_order/data/colors_data.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final double _sideContainer =
        kIsWeb && MediaQuery.of(context).size.width > 600 ? 25 : 20;
    return Column(
      children: [
        Container(
          height: _sideContainer,
          width: _sideContainer,
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
          margin: EdgeInsets.only(right: _sideContainer),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 2, right: 2),
                height: _sideContainer,
                width: _sideContainer,
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
                height: _sideContainer,
                width: _sideContainer,
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
                height: _sideContainer,
                width: _sideContainer,
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
                height: _sideContainer,
                width: _sideContainer,
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
