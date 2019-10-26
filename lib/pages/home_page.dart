import 'package:flutter/material.dart';
import 'package:flutter_advancing/pages/articles_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus feeds"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Avançar"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticlePage(
                  feed: 'https://blog.schoolofnet.com/feed',
                ),
              ),
            );
            // Navigator.pushNamed(context, '/article');
          },
        ),
      ),
    );
  }
}
