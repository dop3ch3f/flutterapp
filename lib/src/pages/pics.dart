import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import '../models/image_model.dart';
import 'dart:convert';
import '../widgets/image_list.dart';

// widget class
class Pics extends StatefulWidget {
  createState() {
    return PicsState();
  }
}

// widget state class
class PicsState extends State<Pics> {
  // counting variable
  int counter = 0;
  List<ImageModel> images = [];
  // baseurl
  String baseurl = "https://jsonplaceholder.typicode.com/photos/";
  // method to fetch images
  void fetchImage() async {
    counter += 1;
    var response = await get('$baseurl$counter');
    var imageModel = ImageModel.fromJsonShort(json.decode(response.body));
    // rerender the app
    setState(() {
      images.add(imageModel);
    });
  }

  void button1(BuildContext context) {
    // go to login route
    Navigator.of(context).pushNamed('/login');
  }

  // main widget build method
  Widget build(context) {
    return new Scaffold(
      body: ImageList(images),
      appBar: AppBar(title: Text('Lets see some images!')),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: new RaisedButton(
            onPressed: () {
              button1(context);
            },
            child: new Text("Go to Login Form")),
      ),
    );
  }
}
