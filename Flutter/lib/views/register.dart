import 'package:flutter/material.dart';
import 'package:flutter_application_2/riverpod/riverpod_managment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

class Register extends ConsumerStatefulWidget {

 
  
  

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child: Column(
            mainAxisSize:MainAxisSize.min,
            children: [
              Icon(
                Icons.phone_android,
                size:100,
              ),
              SizedBox(height:75,),

              Text(
                "Hello Welcome To My German App",
                style:TextStyle(
                  
                  fontWeight:FontWeight.bold,
                  fontSize:20,
                  
                ),
              ),
              SizedBox(height:100,),
              Text(
                "Please Create An Account",
                style:TextStyle(
                  fontSize:20,
                  
                ),
              ),
              SizedBox(height:50),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal:25.0),

                child:Container(

                  decoration:BoxDecoration(
                  color:Colors.grey[200],
                  border:Border.all(color:Colors.white),
                  borderRadius:BorderRadius.circular(12),
                  ),

                child:Padding(
                  padding: const EdgeInsets.only(left:20.0),

                child:TextField(
                controller:ref.read(registerRiverpod).email,
                decoration:const InputDecoration(
                  hintText:"E-MAİL",
                  border:OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.circular(10)),
                  ),

                ),
              ), 
                ),
                
                  
                ),
              ),
              SizedBox(height:10,),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal:25.0),

                child:Container(

                  decoration:BoxDecoration(
                  color:Colors.grey[200],
                  border:Border.all(color:Colors.white),
                  borderRadius:BorderRadius.circular(12),
                  ),
                  child:Padding(
                    padding:const EdgeInsets.only(left:20),

                    child:TextField(
                controller:ref.read(registerRiverpod).password,
                obscureText:true,
                decoration:const InputDecoration(
                  hintText:"Şifre",
                  border:OutlineInputBorder(
                    borderRadius:BorderRadius.all(Radius.circular(10)),
                  ),

                ),
              ),
                  ),
                  

                ),
              ),
              SizedBox(height:20,),
              
              SizedBox(
                width:MediaQuery.of(context).size.width/1.05,
                child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    primary:Colors.deepPurple[600],
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(10),
                    ),
                    padding:EdgeInsets.all(20),
                  ),
                  onPressed: ()async {
                  await ref.read(registerRiverpod).fetch(context);
                  } ,
                  child:const Text("CREATE ACCOUNT",
                  ),
                  ),
              ),
              

            ],
            ),
        
          ),
    );
  }


}

