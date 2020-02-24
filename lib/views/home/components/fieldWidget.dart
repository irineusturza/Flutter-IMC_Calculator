import 'package:flutter/material.dart';


class FieldWidget extends StatefulWidget {
  const FieldWidget({
    Key key,
    @required this.controller, this.text
  }) : super(key: key);

  final TextEditingController controller;
  final String text;

  @override
  _FieldWidgetState createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: widget.text,
          labelStyle: TextStyle(color: Colors.green)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green, fontSize: 25.0),
      validator: (value) {
        if (value.isEmpty) {
          return "${widget.text} is required...";
        }
      },
    );
  }
}