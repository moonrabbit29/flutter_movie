import 'package:flutter/material.dart';
import './detail.dart';

class MoviesList extends StatelessWidget {
  final List movies;
  final String image_url = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/";
  const MoviesList(this.movies);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (ctx, index) {
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
                    this.image_url + this.movies[index]['poster_path'],
                    fit: BoxFit.fill,
                  ),
                ),
                ListTile(
                    title: Text(
                      this.movies[index]['title'],
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
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            this.movies[index]['original_language'],
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
                            this.movies[index]['vote_average'].toString(),
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
                            this.movies[index]['popularity'].toString(),
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
                    onPressed: () {
                      print('click');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detail(movies, index)));
                    },
                  ),
                )
              ],
            ),
          ));
    });
  }
}
