import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tufic_app/const/tufic_theme.dart';

class SearchBar {
  static Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 250,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey.shade300,
          ),
          child: CupertinoTextField(
              placeholder: 'Buscar...',
              prefix: const Icon(
                Icons.search,
                color: Colors.black45,
              ),
              style: TextStyle(
                color: Colors.black87, //tuficTheme.primary,
                fontSize: 15,
                fontFamily: tuficTheme.fonts.text,
              ),
              decoration: const BoxDecoration(color: Colors.transparent))),
    );
  }
}
