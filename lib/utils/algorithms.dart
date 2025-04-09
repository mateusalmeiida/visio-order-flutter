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
        await _mergeSort(dataList.getDataList, setList, vectorKey);
        break;
      case 'Quick Sort':
        await _quickSort(dataList.getDataList, setList, vectorKey);
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

  Future<void> _mergeSort(List<int> list, Function setList,
      GlobalKey<VectorState> vectorKey) async {
    await _mergeSortHelper(list, 0, list.length - 1, setList, vectorKey);
  }

  Future<void> _mergeSortHelper(List<int> list, int start, int end,
      Function setList, GlobalKey<VectorState> vectorKey) async {
    if (start < end) {
      int mid = (start + end) ~/ 2;

      await _mergeSortHelper(list, start, mid, setList, vectorKey);
      await _mergeSortHelper(list, mid + 1, end, setList, vectorKey);

      int flag = await _merge(list, start, mid, end, setList, vectorKey);
      if (flag == -1) return;
    }
  }

  Future<int> _merge(List<int> list, int start, int mid, int end,
      Function setList, GlobalKey<VectorState> vectorKey) async {
    List<int> merged = [];
    int i = start;
    int j = mid + 1;

    while (i <= mid && j <= end) {
      //await vectorKey.currentState?.compareContainers(i, j);
      //await vectorKey.currentState?.delay(300);

      if (list[i] <= list[j]) {
        merged.add(list[i++]);
      } else {
        merged.add(list[j++]);
      }
    }

    while (i <= mid) {
      merged.add(list[i++]);
    }

    while (j <= end) {
      merged.add(list[j++]);
    }

    /*vectorKey.currentState
        ?.animateDown(List.generate(end - start + 1, (k) => start + k));*/

    for (int k = 0; k < merged.length; k++) {
      list[start + k] = merged[k];
      // Atualiza visualização passo a passo
    }
    await vectorKey.currentState?.delay(500);
    print(list);
    if (setList(list, true)) return -1;

    // Marcar como ordenado se quiser
    /*for (int x = start; x <= end; x++) {
      vectorKey.currentState?.setOrdered(x);
    }*/

    return 0;
  }

  Future<void> _quickSort(List<int> list, Function setList,
      GlobalKey<VectorState> vectorKey) async {
    await _quickSortHelper(list, 0, list.length - 1, setList, vectorKey);
  }

  Future<void> _quickSortHelper(List<int> list, int first, int last,
      Function setList, GlobalKey<VectorState> vectorKey) async {
    if (first < last) {
      int splitpoint = await partition(list, first, last, setList, vectorKey);
      if (splitpoint == -1) return;
      await _quickSortHelper(list, first, splitpoint - 1, setList, vectorKey);
      await _quickSortHelper(list, splitpoint + 1, last, setList, vectorKey);
    } else {
      vectorKey.currentState?.setOrdered(first);
      await vectorKey.currentState?.delay(500);
    }
  }

  Future<int> partition(List<int> list, int first, int last, Function setList,
      GlobalKey<VectorState> vectorKey) async {
    int pivotValue = list[first];
    int leftMark = first + 1;
    int rightMark = last;
    await vectorKey.currentState?.selectPivo(first, leftMark, rightMark);
    bool done = false;

    while (!done) {
      while (leftMark <= rightMark && list[leftMark] <= pivotValue) {
        vectorKey.currentState
            ?.changeIcon(first, leftMark, pivotValue, list[leftMark]);
        await vectorKey.currentState?.comparePivo(first, leftMark);
        leftMark++;
        vectorKey.currentState?.indexUncheck(leftMark - 1);

        if (rightMark == leftMark - 1) {
          if (leftMark < last) {
            vectorKey.currentState?.selectLeftmark(leftMark);
          }
          await vectorKey.currentState?.selectRightmark(rightMark);
        } else {
          if (leftMark < last) {
            vectorKey.currentState?.selectLeftmark(leftMark);
          }
        }
      }

      if (leftMark < last && list[leftMark] > pivotValue) {
        vectorKey.currentState
            ?.changeIcon(first, leftMark, pivotValue, list[leftMark]);
        await vectorKey.currentState?.comparePivo(first, leftMark);
      }

      while (list[rightMark] >= pivotValue && rightMark >= leftMark) {
        vectorKey.currentState
            ?.changeIcon(first, rightMark, pivotValue, list[rightMark]);
        await vectorKey.currentState?.comparePivo(first, rightMark);
        rightMark--;
        vectorKey.currentState?.indexUncheck(rightMark + 1);
        if (leftMark == rightMark + 1) {
          if (rightMark > first) {
            vectorKey.currentState?.selectRightmark(rightMark);
          }
          await vectorKey.currentState?.selectLeftmark(leftMark);
        } else {
          if (rightMark > first) {
            vectorKey.currentState?.selectRightmark(rightMark);
          }
        }
      }

      if (rightMark > first && list[rightMark] < pivotValue) {
        vectorKey.currentState
            ?.changeIcon(first, rightMark, pivotValue, list[rightMark]);
        await vectorKey.currentState?.comparePivo(first, rightMark);
      }

      if (rightMark < leftMark) {
        done = true;
      } else {
        vectorKey.currentState?.indexUncheck(leftMark);
        vectorKey.currentState?.indexUncheck(rightMark);

        // Troca os elementos
        await vectorKey.currentState?.swapContainer(leftMark, rightMark);
        int temp = list[leftMark];
        list[leftMark] = list[rightMark];
        list[rightMark] = temp;

        if (setList(list, true)) return -1;
        print(list);

        await vectorKey.currentState?.selectRightAndLeft(leftMark, rightMark);
      }
    }

    vectorKey.currentState?.indexUncheck(leftMark);
    vectorKey.currentState?.indexUncheck(rightMark);

    // Coloca o pivô na posição correta
    await vectorKey.currentState?.swapContainer(first, rightMark);
    int temp = list[first];
    list[first] = list[rightMark];
    list[rightMark] = temp;
    vectorKey.currentState?.setOrdered(rightMark);

    if (setList(list, true)) return -1;
    print(list);

    return rightMark;
  }
}
