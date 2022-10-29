import 'package:flutter/material.dart';
import 'package:italian_food/component/colors.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1,
      child: const CircularProgressIndicator(
        color: MyColor.primary,
      ),
    );
  }
}
