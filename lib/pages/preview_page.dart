import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visio_order/components/items_vector.dart';
import 'package:visio_order/data/colors_data.dart';
import 'package:visio_order/models/data_list.dart';
import 'package:visio_order/utils/algorithms.dart';
import 'package:visio_order/utils/app_routes.dart';
import 'package:visio_order/utils/generate_random.dart';

enum StateAnimation { notStarted, running, finished }

class PreviewPage extends StatefulWidget {
  const PreviewPage({super.key});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  final List<double> _speedAnimation = [0.5, 1.0, 1.5, 2.0];
  int _indexSpeed = 1;
  StateAnimation _stateAnimation = StateAnimation.notStarted;

  void _startAnimation(String algorithm, List<int> list) {
    setState(() {
      _stateAnimation = StateAnimation.running;
    });

    Provider.of<Algorithms>(context, listen: false).sort().then((_) {
      setState(() {
        _stateAnimation = StateAnimation.finished;
      });
    });
  }

  void _refreshAnimation() {
    setState(() {
      _stateAnimation = StateAnimation.notStarted;
    });
  }

  void _generateRandom(int length) {
    final List<int> list = GenerateRandom.generateRandomVector(length);
    setState(() {
      Provider.of<DataList>(context, listen: false).setDataList(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<int> vector = Provider.of<DataList>(context).getDataList;
    final algorithm =
        Provider.of<DataList>(context, listen: false).getAlgorithm;

    if (vector.isEmpty && algorithm.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed(AppRoutes.HOME);
      });

      return const SizedBox();
    }

    final double paddingButton;
    final double fontSize;
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 400) {
      fontSize = 24;
      paddingButton = 10;
    } else if (screenWidth <= 600) {
      fontSize = 25;
      paddingButton = 12;
    } else if (screenWidth <= 800) {
      fontSize = 27;
      paddingButton = 14;
    } else if (screenWidth <= 1000) {
      fontSize = 28;
      paddingButton = 16;
    } else {
      fontSize = 30;
      paddingButton = 15;
    }

    final style = TextStyle(
      fontFamily: 'BebasNeue',
      fontSize: fontSize,
      color: ColorsData.colorsAlgorithm[algorithm]?[1],
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: vector.map((value) {
                  return ItemsVector(
                    length: vector.length,
                    algorithm: algorithm,
                    value: value,
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              if (_stateAnimation == StateAnimation.notStarted)
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                      padding: WidgetStateProperty.all(EdgeInsets.symmetric(
                          horizontal: paddingButton,
                          vertical: paddingButton * 0.7)),
                      backgroundColor: WidgetStateProperty.all(
                          ColorsData.colorsAlgorithm[algorithm]?[1]),
                    ),
                    onPressed: () {
                      _startAnimation(algorithm, vector);
                    },
                    child: FittedBox(
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow,
                            size: fontSize,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Play',
                            style: TextStyle(
                                fontFamily: 'BebasNeue',
                                color: Colors.white,
                                fontSize: fontSize),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (_stateAnimation == StateAnimation.running)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (_indexSpeed > 0) {
                            _indexSpeed--;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.fast_rewind,
                        size: fontSize + 20,
                        color: ColorsData.colorsAlgorithm[algorithm]?[1],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorsData.colorsAlgorithm[algorithm]?[1],
                      ),
                      child: Text(
                        _speedAnimation[_indexSpeed].toStringAsFixed(1),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (_indexSpeed < 3) {
                          setState(() {
                            _indexSpeed++;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.fast_forward,
                        size: fontSize + 20,
                        color: ColorsData.colorsAlgorithm[algorithm]?[1],
                      ),
                    )
                  ],
                ),
              if (_stateAnimation == StateAnimation.finished)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            _refreshAnimation();
                          },
                          icon: Icon(
                            Icons.refresh,
                            size: fontSize + 20,
                            color: ColorsData.colorsAlgorithm[algorithm]?[1],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _refreshAnimation();
                          },
                          child: Text(
                            'Ordenar novamente',
                            style: style,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            _generateRandom(vector.length);
                            _refreshAnimation();
                          },
                          icon: Icon(
                            Icons.casino,
                            size: fontSize + 20,
                            color: ColorsData.colorsAlgorithm[algorithm]?[1],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _generateRandom(vector.length);
                            _refreshAnimation();
                          },
                          child: Text(
                            'Gerar novos números',
                            style: style,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              SizedBox(height: 20),
            ],
          ),
        ));
  }
}
