import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/loading_popup.dart';
import 'package:flutter_application_2/components/onloading.popup.dart';
import 'package:flutter_application_2/components/register_popup.dart';
import 'package:flutter_application_2/service/service.dart';
import 'package:flutter_application_2/views/home.dart';

class LoginRiverpod extends ChangeNotifier{
  final service=Service();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  

  Future<void> fetch(BuildContext context) async{

    if(email.text=="" || password.text==""){
      registerPopup(context);
    }
    else {

    
    onLoading(context);
    await service.loginCall(email:email.text,password:password.text)
    .then((value){
      Navigator.of(context).pop();
      if (value!= null && value.status==true){
        

        Navigator.push(context,MaterialPageRoute(builder:((context) => Home())));
        
      }
      else {
        loadingPopup(context);
        print("Hata oldu");
     //   Grock.back();
      //  Grock.snackBar(title: "HATA", description:"error");
      
      }

    }
    ); 
    }
  }



}