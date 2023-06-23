import 'package:flutter/material.dart';

InputDecoration inputRegisterStyle(String label) => InputDecoration(
      labelText: ' $label',
      labelStyle: const TextStyle(color: Colors.white),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      errorStyle: const TextStyle(color: Colors.amber),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.amber),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.amber),
      ),
    );
