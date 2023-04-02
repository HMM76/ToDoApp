import "package:flutter/material.dart";
class Button extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, top: 10),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(text),
        color: Colors.yellow[300],
        elevation: 0,
      ),
    );
  }
}