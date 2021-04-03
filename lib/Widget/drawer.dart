import 'package:flutter/material.dart';
import 'package:hair_cut_styleapp/screen/home_screen.dart';
import 'package:hair_cut_styleapp/screen/hot_hair%20_cut%20_screen.dart';
import 'package:hair_cut_styleapp/screen/new_hair_cut_screen.dart';
import 'package:hair_cut_styleapp/screen/popular_cut_screen.dart';
import 'package:hair_cut_styleapp/screen/top_hair_cut_screen.dart';


Widget drawer( BuildContext context)
{
  return Drawer(
    child: SafeArea(
      child: Container(
        width: 100,
        color: Colors.black,
        child: ListView(
          children: [

            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/image/drawer_image.png',
                    ),
                    fit: BoxFit.cover,
                  )),
            ),


            ListTile(
              onTap: ()
              {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));

              },
              leading: Icon(Icons.home,color: Colors.white,),
              title: Text('Home',style: TextStyle(
                  color: Colors.white
              ),),
            ),


            ListTile(
              onTap: ()
              {

                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewHairCutScreen()));

              },
              leading: Icon(Icons.cut,color: Colors.white,),
              title: Text('New Hair cut',style: TextStyle(
                  color: Colors.white
              ),),
            ),

            ListTile(
              onTap: ()
              {

                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PopularCutScreen()));

              },
              leading: Icon(Icons.cut,color: Colors.white,),
              title: Text('Popular Hair cut',style: TextStyle(
                  color: Colors.white
              ),),
            ),

            ListTile(
              onTap: ()
              {

                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TopHairCutScreen()));

              },
              leading: Icon(Icons.cut,color: Colors.white,),
              title: Text('Top Hair cut',style: TextStyle(
                  color: Colors.white
              ),),
            ),

            ListTile(
              onTap: ()
              {

                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HotHairCutScreen()));

              },
              leading: Icon(Icons.cut,color: Colors.white,),
              title: Text('Hot Hair cut',style: TextStyle(
                  color: Colors.white
              ),),
            ),

            ListTile(
              leading: Icon(Icons.share,color: Colors.white,),
              title: Text('Share App',style: TextStyle(
                color: Colors.white
              ),),
            ),
            ListTile(
              leading: Icon(Icons.more_outlined,color: Colors.white,),
              title: Text('More App',style: TextStyle(
                color: Colors.white
              ),),
            ),
          ],
        ),
      ),
    ),
  );
}
