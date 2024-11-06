import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cal/view/CalculatorView.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.deepOrange,
      body :SafeArea(
        child :const CalculatorView()
      )

    );
  }
}
