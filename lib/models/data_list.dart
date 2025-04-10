import 'package:flutter/foundation.dart';

class DataList with ChangeNotifier {
  final List<int> _dataList = [];
  final List<int> _mergeListLeft = [];
  final List<int> _mergeListRight = [];
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

  List<int> get getMergeListRight {
    return [..._mergeListRight];
  }

  void setMergeListRight(List<int> list) {
    _mergeListRight.clear();
    _mergeListRight.addAll(list);
    notifyListeners();
  }

  List<int> get getMergeListLeft {
    return [..._mergeListLeft];
  }

  void setMergeListLeft(List<int> list) {
    _mergeListLeft.clear();
    _mergeListLeft.addAll(list);
    notifyListeners();
  }

  void clearMergeLists() {
    _mergeListLeft.clear();
    _mergeListRight.clear();
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
