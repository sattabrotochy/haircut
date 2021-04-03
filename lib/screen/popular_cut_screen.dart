import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hair_cut_styleapp/Data/data_list.dart';
import 'package:hair_cut_styleapp/Widget/drawer.dart';
import 'package:save_in_gallery/save_in_gallery.dart';
import 'package:toast/toast.dart';

class PopularCutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey _globalKey = GlobalKey();

    return Scaffold(
      key: _globalKey,
      drawer: drawer(context),
      appBar: AppBar(
        title: Text('Popular Hair Cut',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
          child: Container(
              color: Colors.black87,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                        Orientation.landscape
                        ? 3
                        : 2,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    childAspectRatio: (1/ 1),
                  ),
                  itemCount: popularcutList.length,
                  itemBuilder: (_, index) {
                    return hearStyleList(url: popularcutList[index]['image'],context: context);
                  }))),
    );
  }
}

Widget hearStyleList({BuildContext context,String url}) {

  return GestureDetector(
    onTap: ()
    {
      showDialogFunc(context: context,url: url);
    },
    child: Container(
      margin: EdgeInsets.all(10.0),
      height: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Image(
        height: 400,
        fit: BoxFit.cover,
        image: AssetImage(url),
      ),
    ),
  );
}

showDialogFunc({context, url}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black54,
            ),
            padding: EdgeInsets.all(15),
            height: 420,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Image(
                      height: 300,
                      image: AssetImage(url),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: ()async
                        {
                          final _imageSaver = ImageSaver();
                          String image;
                          image=url;
                          List<Uint8List> bytesList = [];
                          final bytes = await rootBundle.load(image);
                          bytesList.add(bytes.buffer.asUint8List());
                          final res = await _imageSaver.saveImages(imageBytes: bytesList);
                          Toast.show("Image Save ", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                          print(res);


                        },
                        icon: Icon(Icons.cloud_download,color: Colors.white,size: 35,),
                      ),
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text(
                        "OK",style: TextStyle(color: Colors.white,fontSize: 20),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
