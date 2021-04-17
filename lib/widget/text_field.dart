import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData iconData;
  final TextEditingController controller;
  final bool isObscure, isEnabled, autofocus;
  final bool isReadOnly;
  final TextInputType textInputType;

  const CustomTextField(
      {Key key,
        this.label: "",
        this.autofocus: true,
        this.textInputType: TextInputType.name,
        this.iconData: Icons.data_usage,
        @required this.controller,
        this.isObscure: false,
        this.isEnabled: true,
        this.isReadOnly: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      controller: controller,
      cursorHeight: 20,
      readOnly: isReadOnly,
      autofocus: autofocus,
      enabled: isEnabled,
      keyboardType: textInputType,
      decoration: InputDecoration(
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0),
            borderSide: BorderSide(color: Colors.grey[300])),
        filled: true,
        prefixIcon: Icon(
          iconData,
          size: 20,
        ),
        contentPadding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
        labelText: label,
      ),
    );
  }
}
