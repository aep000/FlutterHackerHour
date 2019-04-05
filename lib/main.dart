import 'package:flutter/material.dart';
import 'PostCard.dart';
import 'DataModels.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'DogFeed'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  _genDogList(){
    for (var i = 0; i < 20; i++) {
      Post.genPost().then((newPost) {
        posts.add(newPost);
      }).whenComplete(() {
        setState(() {

        });
      });
    }
  }

  List<Post> posts = [];
  _MyHomePageState(){
    _genDogList();
  }
  int _counter = 0;

  void _incrementCounter() async {
    /*setState(() {
      _counter++;
    });*/
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    var img = "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.wikihow.com%2Fimages%2F6%2F64%2FStop-a-Dog-from-Jumping-Step-6-Version-2.jpg&f=1";
    var pst = Post(img, "BARK BARK BARK", 120, false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, i){
          return PostCard(posts[i]);
        },
        itemCount: posts.length,
      ),
    );
  }
}
