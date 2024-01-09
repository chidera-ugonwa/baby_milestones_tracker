import 'package:baby_milestones_tracker/Pages/onBoarding/page1.dart';
import 'package:baby_milestones_tracker/Pages/onBoarding/page2.dart';
import 'package:baby_milestones_tracker/Pages/onBoarding/page3.dart';
import '../home.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  bool isBack = false;

  List pages = [const Page1(), const Page2(), const Page3()];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () => _controller.jumpToPage(pages.length),
                child: isLastPage
                    ? const Text(
                        "",
                      )
                    : const Text(
                        'skip',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      )),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    isLastPage = (value == 2);
                    isBack = value < 1;
                  });
                },
                children: List.generate(pages.length, (index) => pages[index])),
          ),
          isLastPage
              ? GestureDetector(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const Home();
                  })),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue.shade200,
                    ),
                    child: const Text(
                      'Done',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                )
              : Container(
                  width: double.infinity,
                  height: 75,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: const WormEffect(
                          dotWidth: 13,
                          dotHeight: 13,
                          activeDotColor: Colors.blue,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue.shade200,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Next',
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
