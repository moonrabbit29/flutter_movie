import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'movies_list.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(brightness: Brightness.light, primaryColor: Colors.red),
        home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List content;
  final String image_url = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/";
  final String url =
      'http://api.themoviedb.org/3/movie/top_rated?api_key=<<---change this with your app key----->>';
  Future<String> getData() async {
    http.Response response = await http
        .get(Uri.encodeFull(url), headers: {'accept': 'application/json'});

    setState(() {
      Map data = json.decode(response.body);
      content = data['results'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cool Movies"),
      ),
      body: Container(margin: EdgeInsets.all(10.0), child: MoviesList(content)),
    );
  }
}
