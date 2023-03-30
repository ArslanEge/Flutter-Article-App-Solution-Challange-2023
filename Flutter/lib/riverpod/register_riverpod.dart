import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/loading_popup.dart';
import 'package:flutter_application_2/components/onloading.popup.dart';
import 'package:flutter_application_2/components/register_popup.dart';
import 'package:flutter_application_2/service/service.dart';
import 'package:flutter_application_2/views/home.dart';
import 'package:flutter_application_2/views/login.dart';

class RegisterRiverpod extends ChangeNotifier{
  final service=Service();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  

  Future<void> fetch(BuildContext context) async{

    if(email.text=="" || password.text==""){
      registerPopup(context);
    }
    else {

    
    onLoading(context);
    await service.RegisterCall(email:email.text,password:password.text)
    .then((value){
      Navigator.of(context).pop();
      if (value!=null){

        Navigator.push(context,MaterialPageRoute(builder:((context) => Login())));
        
      }
      else {
        
        print("KULLANICI YARATILAMADI ");
     //   Grock.back();
      //  Grock.snackBar(title: "HATA", description:"error");
      
      }

    }); 
    
  }
  }



}