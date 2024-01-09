import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              height: size.height * 0.3,
              width: size.width,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/image2.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
              child: const Stack(
                children: [
                  Positioned(
                    bottom: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Afternoon",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Ada & Obi",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Milestones',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Text(
                  'No Milestones Yet',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
