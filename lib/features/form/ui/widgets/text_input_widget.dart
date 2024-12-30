import 'package:flutter/material.dart';

// inputdecoration for text fields
InputDecoration textInputDecoration({required String labelText}) {
  return InputDecoration(
    labelText: labelText,
    // labelText: labelText,
    
    floatingLabelStyle: const TextStyle(color: Colors.red),
    labelStyle: const TextStyle(fontWeight: FontWeight.w300),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 10),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 0.5,
      ), // Default border color
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 2.0,
      ), // Focused border color and width
    ),
  );
}
