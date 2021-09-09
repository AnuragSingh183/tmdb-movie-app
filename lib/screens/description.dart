import 'package:flutter/material.dart';

class Description   extends StatelessWidget {
  final String name,description,posterurl,rating,release,bannerurl;
const  Description(this.name,this.description,this.posterurl,this.rating,this.release,this.bannerurl);
  

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
        final name = routeArgs["name"];
        final description =routeArgs["description"];
        final posterurl = routeArgs["posterurl"];
        final rating = routeArgs["rating"];
        final release = routeArgs["release"];
        final bannerurl = routeArgs["bannerurl"];
    return Scaffold(

      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: 
                  
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,

                    child:Image.network(bannerurl.toString(),fit: BoxFit.cover,)
                  )
                  ),
                  Positioned(
                    bottom: 10,
                    child: Text("  ⭐ Average Rating - "+rating.toString(),
                    style: TextStyle(
                      fontSize: 18
                    ),
                    ))
                ],
              ),
            ),
            SizedBox(
              height:15 ,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(name!=null?name:"Not Found",style: TextStyle(
                fontSize: 24
              ),),
            ),
            Container(
              padding:EdgeInsets.only(left: 10),
              child: Text(
                "Releasing on - "+release.toString()
              ),
            ),
            SizedBox(height:10),
            Row(
               children: [
                 Container(
                   margin: EdgeInsets.all(5),
                   height:200,
                   width: 100,
                   child:Image.network(posterurl),
                 ),
                 Flexible(
                   child: Container(
                    child:Text(description,style: TextStyle(
                      fontSize:18
                    ),)
                   ),
                 )
               ],
            )
          ],
        ),
      ),
    );
    
  }
}

