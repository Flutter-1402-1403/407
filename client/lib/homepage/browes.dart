import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Movie {
  final String title;
  final String imageUrl;
  final double rating;
  final String duration;
  final String year;

  Movie({
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.duration,
    required this.year,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      duration: json['duration'],
      year: json['year'],
    );
  }
}

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  late Future<List<Movie>> futureMovies;

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse('https://yourapi.com/movies'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  void initState() {
    super.initState();
    futureMovies = fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Movie>>(
        future: futureMovies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Movie>? movies = snapshot.data;
            return ListView.builder(
              itemCount: movies?.length,
              itemBuilder: (context, index) {
                final movie = movies![index];
                return ListTile(
                  leading: Image.network(movie.imageUrl),
                  title: Text('${index + 1}. ${movie.title}'),
                  subtitle: Text('${movie.year} | ${movie.duration} | ⭐ ${movie.rating}/10'),
                  trailing: Icon(Icons.bookmark_border),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
