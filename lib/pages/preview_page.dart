import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visio_order/data/colors_data.dart';
import 'package:visio_order/models/data_list.dart';
import 'package:visio_order/utils/app_routes.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({super.key});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  late List<int> vector;
  @override
  void initState() {
    super.initState();
    vector = Provider.of<DataList>(context, listen: false).getDataList;
    if (vector.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed(AppRoutes.HOME);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DataList>(context, listen: false).loadAlgorithm;
    final algorithm = Provider.of<DataList>(context).getAlgorithm;
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
      body: ListView.builder(
          itemCount: vector.length,
          itemBuilder: (ctx, index) {
            return Text('${vector[index]}');
          }),
    );
  }
}
