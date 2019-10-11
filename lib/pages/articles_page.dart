import 'package:flutter/material.dart';
import 'package:flutter_advancing/pages/third_page.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de artigos'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Avançar'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdPage()),
            );
          },
        ),
      ),
    );
  }
}
