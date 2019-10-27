import 'package:flutter/material.dart';
import 'package:flutter_advancing/pages/articles_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final feedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              TextFormField(
                keyboardType: TextInputType.url,
                controller: feedController,
                decoration: InputDecoration(labelText: "Link do RSS"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Campo não pode ficar em branco";
                  }
                },
              ),
              RaisedButton(
                child: Text("Cadastrar"),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print(feedController.text);
                    feedController.text = '';
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
