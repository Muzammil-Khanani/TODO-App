import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todoapp/Home.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List onboarding = [
    {
      "image": "assets/images/todo.png",
    },
    {
      "image": "assets/images/table.png",
    },
    {
      "image": "assets/images/15158927.png",
    }
  ];
  Color white = Color.fromARGB(255, 250, 247, 56);
  PageController pageController = PageController(initialPage: 0);
  int currentpage = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              "Manage Your",
              style: TextStyle(fontSize: 50),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(top: 50, left: 50),
            child: Text(
              "Daily To Do",
              style: TextStyle(fontSize: 50),
            ),
          ),
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentpage = index;
              });
            },
            itemCount: onboarding.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Image.asset(
                          onboarding[index]["image"],
                        ),
                      ),
                      const Text(
                        "Without much worry just manage things as easy as piece of cake",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const WormEffect(
                    dotWidth: 20,
                    dotHeight: 10,
                    radius: 10,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.orange),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (currentpage == onboarding.length - 1)
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home_view()));
                      },
                      child: Text("Continue"),
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minWidth: 200,
                      height: 40,
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
