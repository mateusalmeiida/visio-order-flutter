import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visio_order/data/colors_data.dart';
import 'package:visio_order/models/data_list.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({super.key});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<DataList>(context, listen: false).loadAlgorithm;
    final algorithm = Provider.of<DataList>(context).getAlgorithm;
    final List<int> vector = Provider.of<DataList>(context).getDataList;
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
