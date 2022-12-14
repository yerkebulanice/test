import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final double? height;
  final double? width;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.width = 250,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
      child: TextButton(
        onPressed: () => widget.onPressed(),
        child: Text(
          widget.text,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
