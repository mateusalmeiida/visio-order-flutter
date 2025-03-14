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
    final width = MediaQuery.of(context).size.width < 600
        ? MediaQuery.of(context).size.width * 0.85
        : MediaQuery.of(context).size.width * 0.6;
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
                fontSize: 25,
                fontFamily: 'BebasNeue',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
