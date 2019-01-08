import "package:flutter/material.dart";

class AnimationPage extends StatefulWidget {
  createState() {
    return AnimationPageState();
  }
}

class AnimationPageState extends State<AnimationPage> {
  Widget build(context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Sample Animation'),
      ),
      // body: buildAnimation(),
    );
  }

  Widget buildAnimation() {}
}
