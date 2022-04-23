import 'package:flutter/material.dart';

class wishList extends StatelessWidget {
  const wishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "WishListPage",
        style: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
