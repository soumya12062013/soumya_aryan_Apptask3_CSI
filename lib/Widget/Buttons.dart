import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final Color color;
  final String text;
  final double height;
  final double width;
  final Future<void> Function() path;
  const Button({
    super.key,
    required this.color,
    required this.text,
    required this.height,
    required this.width,
    required this.path,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,

      child: ElevatedButton(
        onPressed: () async {
          await widget.path();
        },
        style: ElevatedButton.styleFrom(backgroundColor: widget.color),
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
