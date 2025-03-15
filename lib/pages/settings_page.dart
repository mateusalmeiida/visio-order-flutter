import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visio_order/components/app_icon.dart';
import 'package:visio_order/data/colors_data.dart';
import 'package:visio_order/models/data_list.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late int vectorSize;

  @override
  void initState() {
    super.initState();
    vectorSize = 2;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DataList>(context, listen: false).loadAlgorithm;
    final algorithm = Provider.of<DataList>(context).getAlgorithm;
    final double margin;
    final double fontSize;
    final double maxSizeVector =
        (kIsWeb && MediaQuery.of(context).size.width >= 700) ? 20 : 10;
    if (vectorSize > maxSizeVector) {
      vectorSize = maxSizeVector.toInt();
    }
    if (MediaQuery.of(context).size.width <= 500) {
      margin = 40;
      fontSize = 22;
    } else if (MediaQuery.of(context).size.width <= 700) {
      margin = 60;
      fontSize = 24;
    } else {
      margin = 70;
      fontSize = 26;
    }

    final style = TextStyle(
      fontFamily: 'RobotoCondensed',
      fontSize: fontSize,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(algorithm),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: ColorsData.colorsAlgorithm[algorithm] ?? [Colors.blue],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            AppIcon(),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.symmetric(horizontal: margin),
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        'Tamanho do Vetor',
                        style: style,
                      ),
                    ),
                    Slider(
                      inactiveColor: Colors.black12,
                      activeColor: ColorsData.colorsAlgorithm[algorithm]?[1],
                      value: vectorSize.toDouble(),
                      onChanged: (newSize) {
                        setState(() {
                          vectorSize = newSize.toInt();
                        });
                      },
                      min: 2,
                      max: maxSizeVector,
                      divisions: maxSizeVector.toInt() - 2,
                      label: '$vectorSize',
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
