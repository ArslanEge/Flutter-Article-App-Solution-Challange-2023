import 'dart:convert';
import 'package:flutter_application_2/components/register_popup.dart';
import 'package:flutter_application_2/model/register_model.dart';
import 'package:flutter_application_2/model/word_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/model/login_model.dart';

class Service{

  final String loginUrl="http://localhost:8000/login";
  

  Future <LoginModel?> loginCall({required String email,required String password}) async {

    Map<String,dynamic> json ={

      "email": email,
      "password":password

    };
    print("Önceli print");
    try {
    
      var response =await http.post(Uri.parse(loginUrl),body:jsonEncode(json),headers: {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json'},);
    print("selamlar");
    if(response.statusCode==200){

      var result =LoginModel.fromJson(jsonDecode(response.body));

      print("BASARILI");

      return result;
      
    }
    else {
      throw("Bir Sorun Oluştu ${response.statusCode}");
      
    }
    }catch (e) {
    print(e);
}
 

}
  final String registerUrl="http://localhost:8000/user";


  Future <RegisterModel?> RegisterCall({required String email,required String password})async {

    Map<String,dynamic> json ={

      "email": email,
      "password":password

    };

    try {
    

    var response =await http.post(Uri.parse(registerUrl),body:jsonEncode(json),headers: {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json'},);

    
    
    if (response.statusCode==200){
      var result=RegisterModel.fromJson(jsonDecode(response.body));

    print(email.runtimeType);
    print(password.runtimeType);

      return result;
    }
    else {
      throw("Bir Sorun Oluştu ${response.statusCode}");

    }
    }
    
    
    catch(e){

      print(e);


    }
    




  }

  final String wordUrl="http://localhost:8000/words";



  Future<WordModel?> WordCall()async {

    var response=await http.get(Uri.parse(wordUrl),headers:{
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json'});

    if(response.statusCode==200){
      
      var result=WordModel.fromJson(jsonDecode(response.body));
      print("WORD CALL ÇALIŞIYOR MU");

     /* for(int i = 0 ; i< result.data.length; i++) {
        print(result.data[i].article.toString() + result.data[i].word.toString() + result.data[i].id.toString());
      }*/
      
      return result;
    }
    else {
      print("HATA");
    }


  }

}