import 'package:flutter/material.dart';

class RequiredText extends StatelessWidget {
  final String text;
  const RequiredText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
