import 'package:flutter/material.dart';

class OptionalText extends StatelessWidget {
  String text;
  OptionalText([this.text = 'Hello']);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
