import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/logo2.png', width: 80),
          Image.asset('assets/images/logo1.png', width: 50),
          Image.asset('assets/images/logo4.png', width: 50),
          Image.asset('assets/images/logo3.png', width: 120),
        ],
      ),
    );
  }
}
