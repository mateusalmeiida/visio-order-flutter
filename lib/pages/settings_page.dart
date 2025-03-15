import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visio_order/components/app_icon.dart';
import 'package:visio_order/components/manual_values_form.dart';
import 'package:visio_order/data/colors_data.dart';
import 'package:visio_order/models/data_list.dart';

enum RunMode { random, manual }

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late int _vectorSize;
  late RunMode _runMode;

  @override
  void initState() {
    super.initState();
    _vectorSize = 2;
    _runMode = RunMode.random;
  }

  void _setManualMode() {
    setState(() {
      _runMode = RunMode.manual;
    });
  }

  void _setRandomMode() {
    setState(() {
      _runMode = RunMode.random;
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    Provider.of<DataList>(context, listen: false).loadAlgorithm;
    final algorithm = Provider.of<DataList>(context).getAlgorithm;

    final double paddingButton;
    final double margin;
    final double fontSize;
    final double iconContainerSize;
    final double paddingIconContainerSize;
    final double maxSizeVector = (kIsWeb && screenWidth >= 600) ? 15 : 7;
    if (_vectorSize > maxSizeVector) {
      _vectorSize = maxSizeVector.toInt();
    }
    if (screenWidth <= 400) {
      iconContainerSize = 25;
      paddingIconContainerSize = 1.5;
      fontSize = 22;
      margin = 25;
      paddingButton = 20;
    } else if (screenWidth <= 600) {
      iconContainerSize = 27.5;
      paddingIconContainerSize = 2;
      fontSize = 24;
      margin = 37.5;
      paddingButton = 22.5;
    } else if (screenWidth <= 800) {
      iconContainerSize = 30;
      paddingIconContainerSize = 3;
      fontSize = 26;
      margin = 50;
      paddingButton = 25;
    } else if (screenWidth <= 1000) {
      iconContainerSize = 35;
      paddingIconContainerSize = 4;
      fontSize = 28;
      margin = 70;
      paddingButton = 30;
    } else {
      iconContainerSize = 40;
      paddingIconContainerSize = 5;
      fontSize = 30;
      margin = 90;
      paddingButton = 35;
    }

    final style = TextStyle(
        fontFamily: 'RobotoCondensed', fontSize: fontSize, color: Colors.black);

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
                  Row(
                    children: [
                      Flexible(
                        child: Slider(
                          inactiveColor: Colors.black12,
                          activeColor: ColorsData.colorsAlgorithm[algorithm]
                              ?[1],
                          value: _vectorSize.toDouble(),
                          onChanged: (newSize) {
                            setState(() {
                              _vectorSize = newSize.toInt();
                            });
                          },
                          min: 2,
                          max: maxSizeVector,
                          divisions: maxSizeVector.toInt() - 2,
                          label: '$_vectorSize',
                        ),
                      ),
                      Container(
                        height: iconContainerSize,
                        width: iconContainerSize,
                        decoration: BoxDecoration(
                          color: ColorsData.colorsAlgorithm[algorithm]?[1],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(paddingIconContainerSize),
                          child: FittedBox(
                              child: Text(
                            '$_vectorSize',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, top: margin * 0.5),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: _setRandomMode,
                          icon: Icon(
                            color: ColorsData.colorsAlgorithm[algorithm]?[1],
                            _runMode == RunMode.random
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            size: iconContainerSize,
                          ),
                        ),
                        TextButton(
                          onPressed: _setRandomMode,
                          child: Text(
                            'Valores Aleatórios',
                            style: style,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, top: margin * 0.5),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _setManualMode();
                          },
                          icon: Icon(
                            color: ColorsData.colorsAlgorithm[algorithm]?[1],
                            _runMode == RunMode.manual
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            size: iconContainerSize,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _setManualMode();
                          },
                          child: Text(
                            'Valores Manuais',
                            style: style,
                          ),
                        )
                      ],
                    ),
                  ),
                  AbsorbPointer(
                    absorbing: _runMode == RunMode.random,
                    child: Opacity(
                      opacity: _runMode == RunMode.manual ? 1 : 0,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: ManualValuesForm(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).orientation ==
                                Orientation.portrait &&
                            !kIsWeb)
                        ? margin * 8
                        : margin * 0.3,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                        padding: WidgetStateProperty.all(EdgeInsets.symmetric(
                            horizontal: paddingButton,
                            vertical: paddingButton * 0.5)),
                        backgroundColor: WidgetStateProperty.all(
                            ColorsData.colorsAlgorithm[algorithm]?[1]),
                      ),
                      onPressed: () {},
                      child: FittedBox(
                        child: Text(
                          'Visualizar',
                          style: TextStyle(
                              fontFamily: 'BebasNeue',
                              color: Colors.white,
                              fontSize: fontSize),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 0
                        : margin * 0.3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
