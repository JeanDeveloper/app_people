import 'package:flutter/material.dart';


class FotoMaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
  
  return Container(
      width: size.width*0.25,
      height: size.width*0.25,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      // child:const Image(
      //   image: AssetImage('assets/laptop.png'),
      // ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          image: NetworkImage(
            'https://cdn.pocket-lint.com/r/s/970x/assets/images/155087-laptops-review-microsoft-surface-laptop-go-review-image1-6ezitk9ymj.jpg'
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}