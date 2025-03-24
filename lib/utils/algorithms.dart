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
      case 'Selection Sort':
        await _selectionSort(dataList.getDataList);
        break;
      case 'Insertion Sort':
        await _insertionSort(dataList.getDataList);
        break;
      case 'Merge Sort':
        await _mergeSort(dataList.getDataList);
        break;
      case 'Quick Sort':
        await _quickSort(dataList.getDataList);
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
        await Future.delayed(Duration(milliseconds: 300), () {
          dataList.setDataList(list);
        });
      }
    }
  }

  Future<void> _selectionSort(List<int> list) async {
    for (int i = 0; i < list.length; i++) {
      int minIndex = i;
      for (int j = i + 1; j < list.length; j++) {
        if (list[j] < list[minIndex]) {
          minIndex = j;
        }
      }
      if (minIndex != i) {
        int temp = list[i];
        list[i] = list[minIndex];
        list[minIndex] = temp;
      }
      await Future.delayed(Duration(milliseconds: 500), () {
        dataList.setDataList(list);
      });
    }
  }

  Future<void> _insertionSort(List<int> list) async {
    for (int index = 1; index < list.length; index++) {
      int currentValue = list[index];
      int position = index;

      while (position > 0 && list[position - 1] > currentValue) {
        list[position] = list[position - 1];
        position--;
      }

      list[position] = currentValue;

      await Future.delayed(Duration(milliseconds: 500), () {
        dataList.setDataList(list);
      });
    }
  }

  Future<void> _mergeSort(List<int> list) async {
    if (list.length > 1) {
      int mid = list.length ~/ 2;
      List<int> lefthalf = list.sublist(0, mid);
      List<int> righthalf = list.sublist(mid);

      await _mergeSort(lefthalf);
      await _mergeSort(righthalf);

      int i = 0, j = 0, k = 0;
      while (i < lefthalf.length && j < righthalf.length) {
        if (lefthalf[i] < righthalf[j]) {
          list[k] = lefthalf[i];
          i++;
        } else {
          list[k] = righthalf[j];
          j++;
        }
        k++;
      }

      while (i < lefthalf.length) {
        list[k] = lefthalf[i];
        i++;
        k++;
      }

      while (j < righthalf.length) {
        list[k] = righthalf[j];
        j++;
        k++;
      }
    }
    await Future.delayed(Duration(milliseconds: 500), () {
      dataList.setDataList(list);
    });
  }

  Future<void> _quickSort(List<int> list) async {
    await _quickSortHelper(list, 0, list.length - 1);
  }

  Future<void> _quickSortHelper(List<int> list, int first, int last) async {
    if (first < last) {
      int splitpoint = await partition(list, first, last);
      await _quickSortHelper(list, first, splitpoint - 1);
      await _quickSortHelper(list, splitpoint + 1, last);
    }
  }

  Future<int> partition(List<int> list, int first, int last) async {
    int pivotValue = list[first];
    int leftMark = first + 1;
    int rightMark = last;
    bool done = false;

    while (!done) {
      while (leftMark <= rightMark && list[leftMark] <= pivotValue) {
        leftMark++;
      }
      while (list[rightMark] >= pivotValue && rightMark >= leftMark) {
        rightMark--;
      }

      if (rightMark < leftMark) {
        done = true;
      } else {
        // Troca os elementos
        int temp = list[leftMark];
        list[leftMark] = list[rightMark];
        list[rightMark] = temp;
      }
    }

    // Coloca o pivô na posição correta
    int temp = list[first];
    list[first] = list[rightMark];
    list[rightMark] = temp;

    await Future.delayed(Duration(milliseconds: 500), () {
      dataList.setDataList(list);
    });

    return rightMark;
  }
}
