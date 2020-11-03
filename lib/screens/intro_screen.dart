import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';


class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController(
      initialPage: 0,
    );
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              Intro1(),
              Intro2(),
              Intro3(),
              Intro4(),
            ],
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
          ),
          new Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                color: Colors.grey[800].withOpacity(0.5),
                height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)*0.06,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      onPressed: null,
                      child: FittedBox(
                        child: Text(
                          "Skip",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    new DotsIndicator(
                      dotsCount: 4,
                      position: _current.toDouble(),
                      decorator: DotsDecorator(
                        color: Colors.white24,
                        activeColor: Colors.white,
                      ),
                    ),
                    new Opacity(
                      opacity: (_current == 0 || _current == 1 || _current == 2)
                          ? 1
                          : 0,
                      child: FlatButton(
                        onPressed: (_current == 0 || _current == 1 || _current == 2)?() {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 150),
                              curve: Curves.ease);
                        }:null,
                        child: FittedBox(
                          child: Text(
                            "Next",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class Intro1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: SafeArea(
        child: Text("hello"),
      ),
    );
  }
}

class Intro2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: SafeArea(
        child: Text("world"),
      ),
    );
  }
}

class Intro3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: SafeArea(
        child: Text("hi"),
      ),
    );
  }
}

class Intro4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: SafeArea(
        child: Text("grocery"),
      ),
    );
  }
}
