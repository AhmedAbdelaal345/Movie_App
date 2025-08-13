import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';

class ProviderController extends ChangeNotifier {
  List<MovieModel> movies = [];
  void addMovie(MovieModel movie) {
    movies.add(movie);
    notifyListeners();
  }

  void removeMovie(MovieModel movie) {
    if (movies.isNotEmpty) {
      movies.remove(movie);
      notifyListeners();
    } else {
      return;
    }
  }
}
