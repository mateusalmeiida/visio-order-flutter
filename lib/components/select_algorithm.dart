import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visio_order/data/colors_data.dart';
import 'package:visio_order/models/data_list.dart';
import 'package:visio_order/utils/app_routes.dart';

class SelectAlgorithm extends StatelessWidget {
  final String algorithm;
  const SelectAlgorithm({required this.algorithm, super.key});

  @override
  Widget build(BuildContext context) {
    final double width;
    final double fontSize;
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 400) {
      fontSize = 25;
      width = screenWidth * 0.85;
    } else if (screenWidth <= 600) {
      fontSize = 26;
      width = screenWidth * 0.85;
    } else if (screenWidth <= 800) {
      fontSize = 28;
      width = screenWidth * 0.6;
    } else if (screenWidth <= 1000) {
      width = screenWidth * 0.6;
      fontSize = 28;
    } else {
      fontSize = 30;
      width = screenWidth * 0.5;
    }
    final height =
        (MediaQuery.of(context).orientation == Orientation.landscape) &&
                MediaQuery.of(context).size.height < 600
            ? MediaQuery.of(context).size.height * 0.2
            : MediaQuery.of(context).size.height * 0.1;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Provider.of<DataList>(context, listen: false).setAlgorithm(algorithm);
          Navigator.of(context).pushNamed(AppRoutes.SETTINGS_PAGE);
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: ColorsData.colorsAlgorithm[algorithm]!)),
          child: Center(
            child: Text(
              algorithm,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontFamily: 'BebasNeue',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
