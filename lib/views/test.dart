import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(viewportFraction: .8, initialPage: _currentPage);
    _pageController.addListener(() {
      setState(() {
        int position = _pageController.page!.toInt();
        if (position != _currentPage) {
          _currentPage = position;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: 5,
          controller: _pageController,
          itemBuilder: (context, index) {
            bool isActive = _currentPage == index;
            return Align(
              alignment: const Alignment(0, 0),
              child: AnimatedContainer(
                height: isActive ? 400 : 370,
                margin: const EdgeInsets.only(right: 8),
                duration: const Duration(microseconds: 2000),
                color: isActive ? Colors.red : Colors.purple,
                curve: Curves.ease,
              ),
            );
          }),
    );
  }
}
