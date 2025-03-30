import 'dart:async';

import 'package:flutter/material.dart';
import 'package:visio_order/components/vector.dart';
import 'package:visio_order/models/data_list.dart';

class Algorithms with ChangeNotifier {
  final DataList dataList;
  final List<List<int>> stepAnimations = [];

  Algorithms(this.dataList);

  Future<void> sort(Function setList, GlobalKey<VectorState> vectorKey) async {
    switch (dataList.getAlgorithm) {
      case 'Bubble Sort':
        await _bubbleSort(dataList.getDataList, setList, vectorKey);
        break;
      case 'Selection Sort':
        await _selectionSort(dataList.getDataList, setList, vectorKey);
        break;
      case 'Insertion Sort':
        await _insertionSort(dataList.getDataList, setList, vectorKey);
        break;
      case 'Merge Sort':
        await _mergeSort(dataList.getDataList, setList);
        break;
      case 'Quick Sort':
        await _quickSort(dataList.getDataList, setList);
        break;
    }
  }

  Future<void> _bubbleSort(List<int> list, Function setList,
      GlobalKey<VectorState> vectorKey) async {
    for (int pass = list.length - 1; pass > 0; pass--) {
      for (int index = 0; index < pass; index++) {
        vectorKey.currentState
            ?.changeIcon(index, index + 1, list[index], list[index + 1]);
        await vectorKey.currentState?.compareContainers(index, index + 1);
        if (list[index] > list[index + 1]) {
          int temp = list[index];
          list[index] = list[index + 1];
          list[index + 1] = temp;

          await vectorKey.currentState?.swapContainer(index, index + 1);
          if (setList(list, true)) return;
        } else {
          await vectorKey.currentState?.delay(350);
        }
      }
      vectorKey.currentState?.setOrdered(pass);
    }
    vectorKey.currentState?.setOrdered(0);
  }

  Future<void> _selectionSort(List<int> list, Function setList,
      GlobalKey<VectorState> vectorKey) async {
    for (int i = 0; i < list.length; i++) {
      int minIndex = i;
      vectorKey.currentState?.indexSelected(i);
      for (int j = i + 1; j < list.length; j++) {
        vectorKey.currentState
            ?.changeIcon(minIndex, j, list[minIndex], list[j]);
        await vectorKey.currentState?.compareContainers(minIndex, j);
        await vectorKey.currentState?.delay(350);
        if (list[j] < list[minIndex]) {
          minIndex = j;
        }
      }
      vectorKey.currentState?.indexUncheck(i);
      if (minIndex != i) {
        await vectorKey.currentState?.swapContainer(i, minIndex);
        int temp = list[i];
        list[i] = list[minIndex];
        list[minIndex] = temp;
        if (setList(list, true)) return;
      }
      vectorKey.currentState?.setOrdered(i);
    }
  }

  Future<void> _insertionSort(List<int> list, Function setList,
      GlobalKey<VectorState> vectorKey) async {
    for (int index = 1; index < list.length; index++) {
      int currentValue = list[index];
      int position = index;

      while (position > 0 && list[position - 1] > currentValue) {
        vectorKey.currentState?.changeIcon(
            position, position - 1, currentValue, list[position - 1]);
        await vectorKey.currentState?.compareContainers(position, position - 1);
        list[position] = list[position - 1];
        await vectorKey.currentState?.swapContainer(position, position - 1);
        list[position - 1] = currentValue;
        if (setList(list, true)) return;
        if (setList(list, true)) return;
        position--;
      }
      if (position == index || position > 0) {
        await vectorKey.currentState?.delay(350);
        vectorKey.currentState?.changeIcon(
            position, position - 1, currentValue, list[position - 1]);
        await vectorKey.currentState?.compareContainers(position, position - 1);
      }

      for (int i = 0; i <= index; i++) {
        vectorKey.currentState?.setOrdered(i);
      }
    }
  }

  Future<void> _mergeSort(List<int> list, Function setList) async {
    if (list.length > 1) {
      int mid = list.length ~/ 2;
      List<int> lefthalf = list.sublist(0, mid);
      List<int> righthalf = list.sublist(mid);

      await _mergeSort(lefthalf, setList);
      await _mergeSort(righthalf, setList);

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
      if (setList(list)) return;
    });
  }

  Future<void> _quickSort(List<int> list, Function setList) async {
    await _quickSortHelper(list, 0, list.length - 1, setList);
  }

  Future<void> _quickSortHelper(
      List<int> list, int first, int last, Function setList) async {
    if (first < last) {
      int splitpoint = await partition(list, first, last, setList);
      await _quickSortHelper(list, first, splitpoint - 1, setList);
      await _quickSortHelper(list, splitpoint + 1, last, setList);
    }
  }

  Future<int> partition(
      List<int> list, int first, int last, Function setList) async {
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
      if (setList(list)) return;
    });

    return rightMark;
  }
}
