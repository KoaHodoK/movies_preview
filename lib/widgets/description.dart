import 'package:flutter/material.dart';
import 'package:movies_preview_app/widgets/text.dart';

class Description extends StatelessWidget {
final String name,descripiton,bannerUrl,postUrl,vote,launch_on;
Description({required this.name,required this.descripiton,required this.bannerUrl,required this.postUrl,required this.vote,required this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          child: ListView(
            children: [
              Container(

                height: 250,
                child: Stack(
                  children: [

                    Positioned(
                      child:Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(postUrl,fit:BoxFit.cover),
                      )
                    ),
                    Positioned(

                        child: IconButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, icon: Icon(Icons.arrow_back_ios,color:Colors.red))),
                    Positioned(
                      bottom: 10,

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: modified_text(text: 'Average Rating : $vote', color: Colors.white,size: 20,),
                        ))
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.only(top:10),
                child: modified_text(text: name==null?'Loading':name, color: Colors.red, size: 22),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: modified_text(text: launch_on, color: Colors.white, size: 16),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: modified_text(text: descripiton, color: Colors.white, size: 18),
              )
            ],
          ),
        ),
      )
    );
  }
}
