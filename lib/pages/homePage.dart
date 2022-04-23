import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "HomePage",
        style: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
