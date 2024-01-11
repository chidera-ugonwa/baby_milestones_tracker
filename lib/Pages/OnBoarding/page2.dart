import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/onBoarding2.png'),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'View and Edit Milestones',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        const SizedBox(
          height: 12,
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'View and edit previously created milestones at your convenience, tweak them as you like, make necessary changes',
            style: TextStyle(fontSize: 15, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
