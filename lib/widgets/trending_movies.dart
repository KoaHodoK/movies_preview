import 'package:flutter/material.dart';
import 'package:movies_preview_app/widgets/description.dart';
import 'package:movies_preview_app/widgets/text.dart';
class TrendingMovies extends StatelessWidget {

final List trending;
const TrendingMovies({required this.trending, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          modified_text(text:'Trending Movies',size:26,color:Colors.white),
          Container(
            height: 300,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Description(name: trending[index]['title'] ?? 'Loading ', bannerUrl:'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                    postUrl: 'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                    descripiton: trending[index]['overview'],
                    vote: trending[index]['vote_average'].toString(),
                    launch_on: trending[index]['release_date'],
                  )));
                },
                child:Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                    width: 140,
                    child:Column(
                      children: [
                        Container(
                          height:200,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']))
                          ),
                        ),
                        Expanded(

                          child: modified_text(text: trending[index]['title'] ?? 'Loading ',
                            color: Colors.white,size: 20,),
                        )
                      ],
                    )
                  ),

              );
            },itemCount: trending.length,),
          ),

        ]
    )
    );
  }
}
