// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class NumberButton extends StatelessWidget {
  Function() action;
  String label;
  Color backgroundColor;
  NumberButton({
    Key? key,
    required this.action,
    required this.label,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: action,
        child: Container(
          padding: const EdgeInsets.all(24.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(1, 1),
                  color: Colors.grey,
                  blurRadius: 0.5,
                  spreadRadius: 1,
                )
              ]),
          child: Text(label),
        ),
      ),
    );
  }
}
