import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final List movies;
  final int id;
  final String image_url = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/";
  Detail(this.movies, this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            movies[id]['title'],
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
            width: 400,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
                child: Column(children: <Widget>[
              SizedBox(
                height: 250.0,
                width: 400.0, // fixed width and height
                child: Image.network(
                  this.image_url + movies[id]['poster_path'],
                  fit: BoxFit.fill,
                ),
              ),
              ListTile(
                  title: Text(
                    movies[id]['title'],
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(children: <Widget>[
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        Text(
                          'Language : ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          movies[id]['original_language'],
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 20.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        Text(
                          'Vote : ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          movies[id]['vote_average'].toString(),
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
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          movies[id]['popularity'].toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      movies[id]['overview'],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )
                  ])),
            ]))));
  }
}
