import 'package:flutter/material.dart';
import 'package:flutter_advancing/pages/articles_page.dart';
import 'package:flutter_advancing/data/save_local.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final feedController = TextEditingController();

  List feeds = [];

  @override
  Widget build(BuildContext context) {
    SaveLocal persistence = new SaveLocal(feedList: feeds);

    persistence.read().then((data) {
      setState(() {
        feeds = data;
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Meus feeds"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: feeds.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(feeds[index]),
                      leading: Icon(Icons.rss_feed),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticlePage(
                              feed: feeds[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.url,
                controller: feedController,
                decoration: InputDecoration(labelText: "Link do RSS"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Campo não pode ficar em branco";
                  }
                  return null;
                },
              ),
              RaisedButton(
                child: Text("Cadastrar"),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      feeds.add(feedController.text);
                      feedController.text = "";

                      persistence.save(feeds);
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
