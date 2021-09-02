import "package:flutter/material.dart";
import './screens/trending.dart';
import './screens/top_rated.dart';
import 'package:tmdb_api/tmdb_api.dart';
void main(){
  runApp(MyApp());


}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(brightness: Brightness.dark,
      primaryColor: Colors.blue),
      home: Home(),
    );
  }
}
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
    
  }
 Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text( 'Flutter Movie App ❤️'),
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: [
            TopRatedMovies(topratedmovies),
            TrendingMovies(
              trendingmovies
            ),
            
            
          ],
        ));
  }
}