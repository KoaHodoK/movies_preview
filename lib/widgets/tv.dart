import 'package:flutter/material.dart';
import 'package:movies_preview_app/widgets/text.dart';

import 'description.dart';
class TV extends StatelessWidget {

  final List tv;
  const TV({required this.tv, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding:const EdgeInsets.all(10),
        child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              modified_text(text:'Shows',size:26,color:Colors.white),
              Container(
                height: 180,
                               child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Description(name: tv[index]['original_name'] ?? 'Loading ', bannerUrl:'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path'],
                          postUrl: 'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path'],
                          descripiton: tv[index]['overview'],
                          vote: tv[index]['vote_average'].toString(),
                          launch_on: tv[index]['first_air_date'],
                        )));
                      },
                      child:Container(
                          padding: EdgeInsets.all(5),
                          width: 250,
                          child:Column(
                            children: [
                              Container(
                               
                                width:250,
                                height: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage('https://image.tmdb.org/t/p/w500'+tv[index]['poster_path']),fit:BoxFit.cover)
                                ),
                              ),
                              SizedBox(width: 20,),
                              Expanded(

                                child: modified_text(text: tv[index]['original_name'] ?? 'Loading ',
                                  color: Colors.white,size: 20,),
                              )
                            ],
                          )
                      ),

                    );
                  },itemCount: tv.length,),
              ),

            ]
        )
    );
  }
}
