import 'package:flutter/foundation.dart';

class DataList with ChangeNotifier {
  final List<int> _dataList = [];
  final List<String> _algorithmList = [
    'Bubble Sort',
    'Selection Sort',
    'Insertion Sort',
    'Merge Sort',
    'Quick Sort',
  ];
  String _algorithm = '';

  String get getAlgorithm {
    return _algorithm;
  }

  void setAlgorithm(String algorithm) {
    _algorithm = algorithm;
    notifyListeners();
  }

  List<int> get getDataList {
    return [..._dataList];
  }

  void setDataList(List<int> list) {
    _dataList.clear();
    _dataList.addAll(list);
    notifyListeners();
  }

  List<String> get algorithmList {
    return [..._algorithmList];
  }
}
