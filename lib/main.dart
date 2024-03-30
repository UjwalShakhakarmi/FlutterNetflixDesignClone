
import 'package:flutter/material.dart';
import 'package:untitled/screens/home.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        //placing widget at the left side i.e. logo in our case
        leading: Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Image.asset('assets/logo.png',fit: BoxFit.cover),
        ),
        //actions means the widget that placed on the right side of the app bar
        actions: [
          Container(
            margin: EdgeInsets.only(right:20.0),
            child: Icon(Icons.search,size: 36,color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(9.0, 5.0, 9.0, 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.white70,
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Movies",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(9.0, 5.0, 9.0, 5.0),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.white70,
                      width: 1.0,
                    ),
                  ),
                    child: Center(
                      child: Text(
                        'Tv Shows',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(9.0, 5.0, 9.0, 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.white70,
                        width: 1.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Documentries',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset('assets/movie2.jpg',fit:BoxFit.cover,
                ),
              ),
            ),
            Home(movieType: "Popular Tv Shows", apiLink: "/tv/top_rated",genres: ""),
            Home(movieType: "War", apiLink: "/discover/movie",genres: "10752"),
            Home(movieType: "Animated", apiLink: "/discover/movie",genres: "16"),
            Home(movieType: "Crime", apiLink: "/discover/movie",genres: "80"),
            Home(movieType: "Sci-Fri", apiLink: "/discover/movie",genres: "878"),
          ],
        ),
      ),
    ),
  ));
}