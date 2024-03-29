import 'package:flutter/material.dart';
import 'package:flutter_advancing/pages/home_page.dart';
import 'package:flutter_advancing/pages/articles_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feeds Reader',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/article': (context) => ArticlePage()
      },
    );
  }
}
