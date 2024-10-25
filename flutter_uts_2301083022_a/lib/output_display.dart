import 'package:flutter/material.dart';

class OutputDisplay extends StatelessWidget {
  final String result;

  OutputDisplay({required this.result});

  @override
  Widget build(BuildContext context) {
    return Text(
      result,
      style: TextStyle(fontSize: 16),
    );
  }
}
