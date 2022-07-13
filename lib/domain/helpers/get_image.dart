import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<Widget> getImage(String? urlimage, {bool create = false} ) async {

  if(urlimage==null){


    if(create){
      
      return const  Image(
      
        image: AssetImage('assets/no-image-create.png'),
        fit: BoxFit.cover,
      
      );

    }

    return const  Image(
    
      image: AssetImage('assets/no-image.png'),
      fit: BoxFit.cover,
    
    );


  }else{

    if ( urlimage.startsWith( 'http' ) ){

      final uri = Uri.parse(urlimage);
      final resp = await http.get(uri);

      if(resp.statusCode==200){

        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
          
            image: NetworkImage(urlimage),
            fit: BoxFit.fill,
          
          ),
        );
      
      }else{
        
        return  const Image(
        
          image: AssetImage('assets/no-image-rectangle.png'),
          fit: BoxFit.cover,
        
        );
      
      }

    }else{
        
      return Image.file(
      
        File( urlimage ),
        fit: BoxFit.fill,
      
      );

    }

  }











}