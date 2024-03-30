import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  final String movieType;
  final String apiLink;
  final String? genres;
  const Home({super.key,required this.movieType, required this.apiLink,required this.genres});
  Future<dynamic> getMovies() async {
    var url = Uri.https('api.themoviedb.org', '/3$apiLink', {
      'api_key': '92cc6ff97f5700f52e2d3a424c1e4b8f',
      'with_genres': '$genres',
    });
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);

    }else {
      throw Future.error("Error ayo");
    }
  }
  Widget build(BuildContext context) {
      return FutureBuilder(future: getMovies(), builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }else if(snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }else {
          var data = snapshot.data;
          return Container(
              margin: EdgeInsets.only(top: 10.0,left: 20.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("$movieType",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for(var movies in data['results'])
                            Container(
                              margin: EdgeInsets.only(left: 5.0),
                              width: 120,
                              height: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${movies['poster_path']}',
                                  height: 200,
                                  width: 120,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  )
                ],
              )
          );
        }
      },
      );
  }


}