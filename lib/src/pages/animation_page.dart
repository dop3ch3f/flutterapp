import "package:flutter/material.dart";
import "../widgets/cat.dart";
import "dart:math";

class AnimationPage extends StatefulWidget {
  createState() {
    return AnimationPageState();
  }
}

class AnimationPageState extends State<AnimationPage>
    with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;
  Animation<double> boxAnimation;
  AnimationController boxController;

  initState() {
    super.initState();

    boxController = AnimationController(
      duration: Duration(
        milliseconds: 300,
      ),
      vsync: this,
    );

    boxAnimation = Tween(
      begin: pi * 0.6,
      end: pi * 0.65,
    ).animate(
      CurvedAnimation(
        curve: Curves.easeInOut,
        parent: boxController,
      ),
    );

    boxAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        boxController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        boxController.forward();
      }
    });

    boxController.forward();

    catController = AnimationController(
      duration: Duration(milliseconds: 170),
      vsync: this,
    );

    catAnimation = Tween(begin: -70.0, end: -200.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );
  }

  onTap() {
    switch (catController.status) {
      case AnimationStatus.completed:
        boxController.forward();
        catController.reverse();
        break;
      case AnimationStatus.dismissed:
        boxController.stop();
        catController.forward();
        break;
      case AnimationStatus.forward:
        catController.reverse();
        break;
      case AnimationStatus.reverse:
        catController.forward();
        break;
      default:
        catController.forward();
    }
  }

  Widget build(context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Sample Animation'),
      ),
      body: GestureDetector(
        child: Center(
          child: Stack(
            children: <Widget>[
              buildCatAnimation(),
              buildBox(),
              buildLeftFlap(),
              buildRightFlap(),
            ],
            overflow: Overflow.visible,
          ),
        ),
        onTap: onTap,
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Tap anywhere", style: TextStyle(color: Colors.white)),
        ],
      )),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      builder: (context, child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          right: 0.0,
          left: 0.0,
        );
      },
      animation: catAnimation,
      child: Cat(),
    );
  }

  Widget buildBox() {
    return Container(
      height: 200.0,
      width: 200.0,
      color: Colors.brown,
    );
  }

  Widget buildLeftFlap() {
    return Positioned(
      left: 3.0,
      child: AnimatedBuilder(
        child: Container(
          height: 10.0,
          width: 125.0,
          color: Colors.brown,
        ),
        animation: boxAnimation,
        builder: (context, child) {
          return Transform.rotate(
            child: child,
            angle: boxAnimation.value,
            alignment: Alignment.topLeft,
          );
        },
      ),
    );
  }

  Widget buildRightFlap() {
    return Positioned(
      right: 3.0,
      child: AnimatedBuilder(
        child: Container(
          height: 10.0,
          width: 125.0,
          color: Colors.brown,
        ),
        animation: boxAnimation,
        builder: (context, child) {
          return Transform.rotate(
            child: child,
            angle: -boxAnimation.value,
            alignment: Alignment.topRight,
          );
        },
      ),
    );
  }
}
