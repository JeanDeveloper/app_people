import 'package:flutter/material.dart';

class MenuWaves extends StatelessWidget {

  final Widget child;

  const MenuWaves({required this.child});

  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.3,
      width: double.infinity,
      child: CustomPaint(
        painter: _MenuCustomPainter(),
        child: child,
      ),
    );
  }
}

class _MenuCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      final lapiz = Paint();
      final lapiz2 = Paint();
      final path = Path();
      final path2 = Path();

      // Propiedades del fondo
      lapiz.color = Color(0xff0643c7);
      lapiz.style = PaintingStyle.fill; // .fill .stroke

      //Propiedades del borde

      lapiz2.color = Color(0xfff0f013);
      lapiz2.style = PaintingStyle.stroke;
      lapiz2.strokeWidth = 3;


      // Dibujar con el path y el lapiz del fondo
      path.moveTo(0.0, size.height);
      path.lineTo(0, size.height*0.7);
      path.lineTo( size.width*0.1, size.height*0.7 );
      path.quadraticBezierTo(size.width * 0.5, size.height * 0.8, size.width*0.9, size.height * 0.7 );
      path.lineTo( size.width, size.height*0.7 );
      path.lineTo( size.width, size.height );
      path.lineTo( size.width, size.height );
      canvas.drawPath(path, lapiz );

      // Dibujar con el path y el lapiz del border
      path2.moveTo(0, size.height*0.7);
      path2.lineTo( size.width*0.1, size.height*0.7 );
      path2.quadraticBezierTo(size.width * 0.5, size.height * 0.8, size.width*0.9, size.height * 0.7 );
      path2.lineTo( size.width, size.height*0.7 );
      canvas.drawPath(path2, lapiz2 );



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}