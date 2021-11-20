import 'package:flutter/material.dart';
import 'package:movies_preview_app/widgets/text.dart';

import 'description.dart';
class TopRatedMovies extends StatelessWidget {

  final List toprated;
  const TopRatedMovies({required this.toprated, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding:const EdgeInsets.all(10),
        child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              modified_text(text:'Top Rated Movies',size:26,color:Colors.white),
              Container(
                height: 300,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Description(name: toprated[index]['title'] ?? 'Loading ', bannerUrl:'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],
                          postUrl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'],
                          descripiton: toprated[index]['overview'],
                          vote: toprated[index]['vote_average'].toString(),
                          launch_on: toprated[index]['release_date'],
                        )));
                      },
                      child:Container(
                          width: 140,
                          child:Column(
                            children: [
                              Container(
                                height:200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']))
                                ),
                              ),
                              Expanded(

                                child: modified_text(text: toprated[index]['title'] ?? 'Loading ',
                                  color: Colors.white,size: 20,),
                              )
                            ],
                          )
                      ),

                    );
                  },itemCount: toprated.length,),
              ),

            ]
        )
    );
  }
}
