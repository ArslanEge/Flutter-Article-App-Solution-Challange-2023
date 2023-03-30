import 'package:flutter/material.dart';

TrueWordPopup(BuildContext context){
  
  showDialog(
    context:context,
    barrierDismissible:false,
    builder:(BuildContext context){
      return AlertDialog(

        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(20)
        ),

        title:Text("YOUR ANSWER IS TRUE SUPER!"),

        actions: [
          MaterialButton(
            child:Text("GO BACK"),
            color:Colors.yellow,
            shape:StadiumBorder(),
            minWidth:100,
            onPressed:(){
              Navigator.of(context).pop();
            },
          )
        ],

      );
    }
  );
}

FalseWordPopup(BuildContext context){
  
  showDialog(
    context:context,
    barrierDismissible:false,
    builder:(BuildContext context){
      return AlertDialog(

        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(20)
        ),

        title:Text("YOUR ANSWER IS FALSE"),

        actions: [
          MaterialButton(
            child:Text("GO BACK"),
            color:Colors.red,
            shape:StadiumBorder(),
            minWidth:100,
            onPressed:(){
              Navigator.of(context).pop();
            },
          )
        ],

      );
    }
  );
}