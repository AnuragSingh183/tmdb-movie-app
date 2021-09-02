

  

import 'package:flutter/material.dart';



class TrendingMovies extends StatelessWidget {
  final List trendingmovies;

const TrendingMovies(this.trendingmovies);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Movies',
            style:TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:20
            )
            
          ),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingmovies.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trendingmovies[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Text(
                                  
                                   trendingmovies[index]['title'] != null
                                      ? trendingmovies[index]['title']
                                      : 'Loading'),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
