import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List content;
  final String image_url = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/";
  final String url =
      'http://api.themoviedb.org/3/movie/top_rated?api_key=<-put your api key here->';
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
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light, primaryColor: Colors.red),
      home: new Scaffold(
          appBar: AppBar(
            title: Text("Movie Cool"),
          ),
          body: Container(
            margin: EdgeInsets.all(10.0),
            child: ListView.builder(itemBuilder: (ctx, index) {
              return Container(
                  width: 400,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 250.0,
                          width: 400.0, // fixed width and height
                          child: Image.network(
                            this.image_url + content[index]['poster_path'],
                            fit: BoxFit.fill,
                          ),
                        ),
                        ListTile(
                            title: Text(
                              content[index]['title'],
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(children: <Widget>[
                              SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Language : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    content[index]['original_language'],
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Vote : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    content[index]['vote_average'].toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 22.0,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Popular : ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    content[index]['popularity'].toString(),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ])),
                        SizedBox(
                          width: double.infinity,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            highlightColor: Colors.red,
                            color: Colors.redAccent,
                            child: Text(
                              "Detail",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ));
            }),
          )),
    );
  }
}
