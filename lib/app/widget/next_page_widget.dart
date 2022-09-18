// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NextPageWiget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const NextPageWiget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(horizontal: 52, vertical: 32),
      ),
      onPressed: onClicked,
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
