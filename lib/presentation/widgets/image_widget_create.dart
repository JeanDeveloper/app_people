import 'package:apppeople/domain/helpers/get_image.dart';
import 'package:flutter/material.dart';


class ImageWidgetCreate extends StatelessWidget{

  final String? urlimage;

  const ImageWidgetCreate({this.urlimage});

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(

      future: getImage(urlimage, create: true),

      builder: (context,AsyncSnapshot<Widget> snapshot) {

        if(!snapshot.hasData) return const CircularProgressIndicator();

        if(snapshot.hasData) return snapshot.data!;

        return Container();

       
      },

    );

  }

}