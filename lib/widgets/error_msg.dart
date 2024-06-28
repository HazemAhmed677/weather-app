import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorMsg extends StatelessWidget {
  const ErrorMsg({super.key, required this.errorMsg});
  final String errorMsg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorMsg,
              style: const TextStyle(color: Colors.red, fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
