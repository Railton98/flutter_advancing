import 'package:flutter/material.dart';
import 'package:flutter_advancing/data/get_feed_data.dart';

class ArticlePage extends StatefulWidget {
  final String feed;

  ArticlePage({Key key, this.feed}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState(this.feed);
}

class _ArticlePageState extends State<ArticlePage> {
  final String feed;
  Future<List> articles;

  _ArticlePageState(this.feed);

  @override
  Widget build(BuildContext context) {
    GetFeedData rss = GetFeedData();
    articles = rss.read(url: this.feed);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de artigos'),
      ),
      body: FutureBuilder(
        future: articles,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return messageTemplate(
                title: 'Carregando lista de artigos',
                icon: Icons.refresh,
              );
              break;
            default:
              if (snapshot.hasError) {
                return messageTemplate(
                  title: 'Não foi possível carregar',
                  icon: Icons.error,
                );
              }
              return messageTemplate(
                title: 'Lista de artigos carregada',
                icon: Icons.done,
              );
              break;
          }
        },
      ),
    );
  }
}

messageTemplate({String title, IconData icon}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        Text(title)
      ],
    ),
  );
}
