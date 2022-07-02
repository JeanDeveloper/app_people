import 'package:flutter/material.dart';


class FotoAvatarWidget extends StatelessWidget {
  
  final void Function()? onPressed;
  final bool onlyShow;
  final String? pathImage;
  double radius;

  FotoAvatarWidget({
    super.key, 
    this.onPressed, 
    this.radius=55,
    this.onlyShow=true,
    this.pathImage,
  });

  @override
  Widget build(BuildContext context) {

    return CircleAvatar(

      backgroundImage: (pathImage!.isEmpty)
        ? const AssetImage('assets/no-image.png')
        : null,

      radius: radius,

      child: Container(

        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.bottomRight,

        child: onlyShow
        ? null 
        :IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.camera_alt_outlined, size: 30, color: Colors.black), 
        ), 

      ),

    );

  }

}