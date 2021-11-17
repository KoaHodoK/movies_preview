import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_preview_app/widgets/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'widgets/trending_movies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List trendingMovies=[];
  List topratedmovies=[];
  List tv=[];
  final String apikey="e15bf6a72c5198ca3bc3e71db3b1ea9d";
  final readaccetoken="eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMTViZjZhNzJjNTE5OGNhM2JjM2U3MWRiM2IxZWE5ZCIsInN1YiI6IjYxNWE3YjIyMTU2Y2M3MDA4YjIwMzJlYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KERrUi70D0oxip7yMmVPSBxN7f4dRvkZySrKg45iDyw";




  loadmovies() async{
TMDB tmdbWithCustomlogs=TMDB(ApiKeys(apikey,readaccetoken),logConfig:
ConfigLogger(
  showLogs: true,
  showErrorLogs: true,
));
Map trendingresult=await tmdbWithCustomlogs.v3.trending.getTrending();
Map topratedresult=await tmdbWithCustomlogs.v3.movies.getTopRated();
Map tvresult=await tmdbWithCustomlogs.v3.tv.getPouplar();

setState((){
  trendingMovies=trendingresult['results'];
  topratedmovies=topratedresult['results'];
  tv=tvresult['results'];
});
print(trendingMovies);
print(topratedmovies);
print(tv);


  }

@override
  void initState() {
   loadmovies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: modified_text(text: 'Movie Preview',color: Colors.white,size:24)
      ),
      body:ListView(
        children:[TrendingMovies(trending:trendingMovies)]

      ),

    );
  }
}
