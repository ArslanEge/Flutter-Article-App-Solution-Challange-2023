import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

loadingPopup(BuildContext context){

  showDialog(
    context: context,
    barrierDismissible: false,
     builder:(BuildContext context) {
      return AlertDialog(

        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(20)
        ),

        title:Text("INCORRECT PASSWORD "),
        actions: [
          MaterialButton(
            child:Text("BACK"),
            color:Colors.blue[900],
            shape:StadiumBorder(),
            minWidth:100,
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      );
     },
     
     );

}