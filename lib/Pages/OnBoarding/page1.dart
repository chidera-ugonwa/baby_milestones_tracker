import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/onBoarding1.png'),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Add Your Baby's Milestones",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Easily create new milestone's for your baby as they happen so as to document all the important memories.",
          style: TextStyle(fontSize: 15, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
