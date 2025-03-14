import 'package:flutter/foundation.dart';
import 'package:visio_order/data/store.dart';

class DataList with ChangeNotifier {
  final List<int> _dataList = [];
  final List<String> _algorithmList = [
    'Bubble Sort',
    'Selection Sort',
    'Insertion Sort',
    'Merge Sort',
    'Quick Sort',
  ];
  String _algorithm = 'Bubble Sort';

  Future<void> get loadAlgorithm async {
    if (kIsWeb) {
      _algorithm = await Store.getString('alg');
      notifyListeners();
    }
  }

  String get getAlgorithm {
    return _algorithm;
  }

  void setAlgorithm(String algorithm) {
    _algorithm = algorithm;
    if (kIsWeb) {
      Store.saveString('alg', algorithm);
    }
  }

  List<int> get dataList {
    return [..._dataList];
  }

  List<String> get algorithmList {
    return [..._algorithmList];
  }
}
