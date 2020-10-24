import 'package:flutter/material.dart';

decoration(String label, String hint) {
  return InputDecoration(
    hintMaxLines: 2,
    labelText: label,
    hintText: hint,
    labelStyle: TextStyle(color: Colors.teal),
    hintStyle: TextStyle(color: Colors.teal),
    errorStyle: TextStyle(color: Colors.red),
    focusColor: Colors.teal,
    suffixIcon: Icon(Icons.add),
    focusedErrorBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
  );
}
