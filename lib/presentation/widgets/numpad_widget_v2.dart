import 'package:apppeople/domain/providers/numpad_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumPad extends StatelessWidget {

  final int length;
  final Function onPressed;

  const NumPad({
    required this.length, 
    required this.onPressed
  });

  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final numpadProvider= Provider.of<NumPadProvider>(context); 
    
    return Container(

      width: size.width,
      height: size.height*0.65,

      child: Column( 

        children: <Widget>[

          Preview(text: numpadProvider.number, length: length),

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: <Widget>[

              NumpadButton(
                text: '1',
                onPressed: ()=>numpadProvider.setValue('1', length),
              ),
              NumpadButton(
                text: '2',
                onPressed: ()=>numpadProvider.setValue('2', length),
              ),
              NumpadButton(
                text: '3',
                onPressed: ()=>numpadProvider.setValue('3', length),
              ),
            
            ],

          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumpadButton(
                text: '4',
                onPressed: ()=>numpadProvider.setValue('4', length),
              ),
              NumpadButton(
                text: '5',
                onPressed: ()=>numpadProvider.setValue('5', length),
              ),
              NumpadButton(
                text: '6',
                onPressed: ()=>numpadProvider.setValue('6', length),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumpadButton(
                text: '7',
                onPressed: ()=>numpadProvider.setValue('7', length),
              ),
              NumpadButton(
                text: '8',
                onPressed: ()=>numpadProvider.setValue('8', length),
              ),
              NumpadButton(
                text: '9',
                onPressed: ()=>numpadProvider.setValue('9', length),
              ),
            ],
          ),

          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: <Widget>[
              NumpadButton(
                haveBorder: false,
                icon: Icons.check,
                onPressed: (){
                  onPressed(numpadProvider.number);
                  numpadProvider.number = '';
                },
              ),
              NumpadButton(
                text: '0',
                onPressed: ()=>numpadProvider.setValue('0', length),
              ),
              NumpadButton(
                haveBorder: false,
                icon: Icons.backspace,
                onPressed: ()=>numpadProvider.backspace(numpadProvider.number),
              ),
            ],

          )
        
        ],

      ),

    );
  }
}


class Preview extends StatelessWidget {

  final int length;
  final String text;

  const Preview({super.key, required this.length, required this.text});

  @override
  Widget build(BuildContext context) {
    
    List<Widget> previewLength = [];

    for (var i = 0; i < length; i++) {

      bool valor = text.length >= i+1;
      previewLength.add(Dot(isActive: valor, number: valor? text.substring(i,i+1) : null));

    } 

    return Container(

      padding: const EdgeInsets.symmetric(vertical: 50.0),

      child: Wrap(

        children: previewLength

      )
    
    );
  
  
  }

}


class Dot extends StatelessWidget {
  final bool isActive;
  final String? number;
  const Dot({ this.isActive = false, this.number});
  

  @override
  Widget build(BuildContext context) {

    return  Container(

      padding: const  EdgeInsets.all(8.0),
      child: isActive
      ? Container(width: 20.0, height: 20.0,child: Text('$number', style: const TextStyle(color: Colors.white, fontSize:20, fontWeight: FontWeight.bold)))      
      : Container(
        width: 20.0,
        height: 20.0,

        decoration: BoxDecoration(

          border: Border.all(
            width: 1.0,
            color: Colors.white
          ),
          
          borderRadius: BorderRadius.circular(30.0),
        ),

      ),

    );

  }

}


class NumpadButton extends StatelessWidget {

  final String? text;
  final IconData? icon;
  final bool haveBorder;
  final Function()? onPressed;
  const NumpadButton({ this.text, this.icon, this.haveBorder=true,  this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextStyle buttonStyle = const TextStyle(fontSize: 20, color: Colors.black);
    Widget label = icon != null ? Icon(icon, color: Colors.white, size: 30.0)
      : Text(text ?? '', style: buttonStyle);
      
    return OutlinedButton(


      onPressed: onPressed, 
      style: ButtonStyle(
        
        backgroundColor: haveBorder ? MaterialStateProperty.all(Colors.white) : MaterialStateProperty.all(Colors.transparent),
        side: haveBorder ? MaterialStateProperty.all(const BorderSide(color: Colors.grey)) : MaterialStateProperty.all(BorderSide.none),
        padding: MaterialStateProperty.all(EdgeInsets.all(size.width*0.07)),
        shape: MaterialStateProperty.all(const CircleBorder()),
        
      ),
      child: label,
    );
  }
}
