import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:visio_order/models/data_list.dart';

class ManualValuesForm extends StatefulWidget {
  final int length;
  final GlobalKey<FormState> formKey;

  const ManualValuesForm(
      {required this.length, required this.formKey, super.key});

  @override
  State<ManualValuesForm> createState() => _ManualValuesFormState();
}

class _ManualValuesFormState extends State<ManualValuesForm> {
  List<int> _numbers = [];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataList>(context, listen: false);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Form(
        key: widget.formKey,
        child: TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[\d,]')),
          ],
          decoration: InputDecoration(
            errorMaxLines: 2,
            helperText: 'O valor máximo aceito é de 99',
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 20),
            labelText: 'Ex: 7,8,9,8,43,21',
            labelStyle: TextStyle(color: Colors.black38),
          ),
          onSaved: ((_) {
            provider.setDataList(_numbers);
          }),
          validator: ((list) {
            if (list == null || list.isEmpty) {
              return 'A lista não pode estar vazia';
            }
            final values = list.split(',');

            _numbers = values
                .map((value) => value.trim())
                .where((value) => value.isNotEmpty)
                .map((value) => int.tryParse(value))
                .whereType<int>()
                .map((value) => value > 99 ? 99 : value)
                .toList();

            if (_numbers.length != widget.length) {
              return "A lista deve conter ${widget.length} elementos";
            }

            return null;
          }),
        ),
      ),
    );
  }
}
