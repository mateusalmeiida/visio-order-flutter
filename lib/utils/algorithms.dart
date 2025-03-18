import 'dart:async';

import 'package:flutter/material.dart';
import 'package:visio_order/models/data_list.dart';

class Algorithms with ChangeNotifier {
  final DataList dataList;
  final List<List<int>> stepAnimations = [];

  Algorithms(this.dataList);

  Future<void> sort() async {
    switch (dataList.getAlgorithm) {
      case 'Bubble Sort':
        await _bubbleSort(dataList.getDataList);
        break;
    }
  }

  Future<void> _bubbleSort(List<int> list) async {
    for (int pass = list.length - 1; pass > 0; pass--) {
      for (int index = 0; index < pass; index++) {
        if (list[index] > list[index + 1]) {
          int temp = list[index];
          list[index] = list[index + 1];
          list[index + 1] = temp;
        }
      }
      await Future.delayed(Duration(milliseconds: 500), () {
        dataList.setDataList(list);
      });
    }
  }
}
