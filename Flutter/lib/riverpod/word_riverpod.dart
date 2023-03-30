import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/word_popup.dart';
import 'package:flutter_application_2/model/word_model.dart';
import 'package:flutter_application_2/service/service.dart';



class WordRiverpod extends ChangeNotifier{

  final service=Service();
  String name="bu mu";

   static List<Datum> words =[];
  

  
  Future<void> control(String article,int index,BuildContext context) async {
    
    
    await service.WordCall().then((value){

      words=value!.data;
      
      if(words[index].article==article){
        
        TrueWordPopup(context);
      }
      else {
        FalseWordPopup(context);
      }
      

      
    });



  }
  

    Future<String?> getName(int index) async {

      await service.WordCall().then((value){

         name= value!.data[index].word.toString();
         print("!!!");
         print(name);

         return value.data[index].word.toString();
    });



  }

   String getValue(){

    return name.toString();
  }
 
}
  



