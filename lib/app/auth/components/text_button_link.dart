import 'package:flutter/material.dart';

class TextButtonLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const TextButtonLink({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
