import 'package:flutter/material.dart';
import 'package:baby_milestones_tracker/Resources/widget_manager.dart';

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
      body: ListView(
        children: [
          Container(
            height: size.height * 0.45,
            width: size.width,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/image2.png'), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                const Positioned(
                  bottom: 1,
                  child: Column(
                    children: [
                      Text("Good Afternoon",
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "Ada & Obi",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 45,
                        child: Image.asset(
                          'assets/mum.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        maxRadius: 35,
                        child: Image.asset(
                          'assets/child.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 210,
            width: 100,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Baby State",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    stateCard(
                        widget: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/baby sleep.png'),
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 20, right: 8),
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                  color: Colors.orange, shape: BoxShape.circle),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "10 min",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "baby is not ready for this yet",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ],
                    )),
                    stateCard(
                        widget: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/baby-bottle.png'),
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 20, right: 8),
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                  color: Colors.lightGreen,
                                  shape: BoxShape.circle),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "5 min",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "baby is not ready for this yet",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ],
                    )),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 400,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Recent",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      recentCard(
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/baby-bottle.png',
                                    scale: 0.8,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1 hr 15 min ago",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                      ),
                                      Text(
                                        "eat for 10 min",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 13),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 2,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.timer_rounded,
                                    size: 40,
                                  ),
                                ],
                              )
                            ],
                          ),
                          background: const Color(0xffADEBED)),
                      recentCard(
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/diaperr.png',
                                    scale: 1.6,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1 hr 15 min ago",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                      ),
                                      Text(
                                        "eat for 10 min",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 13),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 2,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.timer_rounded,
                                    size: 40,
                                  ),
                                ],
                              )
                            ],
                          ),
                          background: const Color(0xffF6BFB4)),
                      recentCard(
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/baby sleep.png',
                                    scale: 1,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1 hr 15 min ago",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                      ),
                                      Text(
                                        "eat for 10 min",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 13),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 2,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.timer_rounded,
                                    size: 40,
                                  ),
                                ],
                              )
                            ],
                          ),
                          background: const Color(0xffBDC0E1)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
