import 'package:flutter/material.dart';

registerPopup(BuildContext context){
  
  showDialog(
    context:context,
    barrierDismissible:false,
    builder:(BuildContext context){
      return AlertDialog(

        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(20)
        ),

        title:Text("PLEASE ENTER MAIL AND PASSWORD"),

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