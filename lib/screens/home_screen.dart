import 'package:flutter/material.dart';

import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = "d0896e27de2adef1a51256072ad32558";
  final String readaccesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMDg5NmUyN2RlMmFkZWYxYTUxMjU2MDcyYWQzMjU1OCIsInN1YiI6IjYxMmYwNmVjOTNkYjkyMDA4OGFmN2FjYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XPQVu_yqBoZnnJO2OGh95108de5uRckZAY74zE80bro";

  void initState() {
    loadmovies(); //wenever my app starts load movies fn will run
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    setState(() {
      trendingmovies = trendingresult["results"];
      topratedmovies = topratedresult["results"];
      tv = tvresult["results"];
    });
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Movie App",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Trending Movies",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      children: [
                        
                        Text(trendingmovies[index]['title'] == null
                            ? "Unknown"
                            : trendingmovies[index]['title']),
                      ],
                    ),
                  ),
                );
              },
              itemCount: trendingmovies.length,
            ),
          ),
        ],
      ),
    );
  }
}
