import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/onBoarding3.png'),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Relive Precious Memories',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Revisit precious memories whenever you want and relive them, viewing them here is itself an unforgettable experience!",
          style: TextStyle(fontSize: 15, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
