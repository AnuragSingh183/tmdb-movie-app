List<Map> favorites = [];

String addFavorites(movie) {
  int ind = favorites.indexWhere((element) => element["name"] == movie["name"]);
  if (ind == -1) {
    favorites.add(movie);
    return "Added to favorites successfully";
  } else {
    return "Movie already added to favorites";
  }
}

void removeFavorites(movie) {
  favorites.remove(movie);
}
