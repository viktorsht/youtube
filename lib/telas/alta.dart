import 'package:flutter/material.dart';

class Alta extends StatefulWidget {
  const Alta({Key? key}) : super(key: key);

  @override
  State<Alta> createState() => _AltaState();
}

class _AltaState extends State<Alta> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
        "Em Alta",
        style: TextStyle(
          fontSize: 25
        )       
        ),
      ),
    );
  }
}