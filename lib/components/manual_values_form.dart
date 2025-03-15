import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ManualValuesForm extends StatefulWidget {
  const ManualValuesForm({super.key});

  @override
  State<ManualValuesForm> createState() => _ManualValuesFormState();
}

class _ManualValuesFormState extends State<ManualValuesForm> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Form(
        child: TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[\d,]')),
          ],
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 20),
            labelText: 'Ex: 7,8,9,8,43,21',
            labelStyle: TextStyle(color: Colors.black38),
          ),
        ),
      ),
    );
  }
}
