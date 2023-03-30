import 'package:flutter/material.dart';
import 'package:flutter_application_2/riverpod/riverpod_managment.dart';
import 'package:flutter_application_2/views/register.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

class Login extends ConsumerStatefulWidget {

 
  
  

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_LoginState();
}

class _LoginState extends ConsumerState<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[300],
      body:Center(
          child: Column(
           
           mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            
            
            children: [
              SizedBox(height:10,),
              
              Icon(
                Icons.android,
                size:100,
              ),
              
              SizedBox(height:25,),
              Text(
                "Hello Again!",
                style:TextStyle(
                  
                  fontWeight:FontWeight.bold,
                  fontSize:52,
                  
                ),
              ),
              SizedBox(height:5,),
              
              Text(
                'Welcome back, you \'ve been missed!',
                style:TextStyle(
                  height: -4,
                  fontSize:20,
                  
                  
                ),
              ),
              Column(
                children: [
                Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child:Container(
                decoration:BoxDecoration(
                  color:Colors.grey[200],
                  border:Border.all(color:Colors.white),
                  borderRadius:BorderRadius.circular(12),
                ),
                child:Padding(
                padding:const EdgeInsets.only(left:20.0),
                child:TextField(
                controller:ref.read(loginRiverpod).email,
                decoration:const InputDecoration(
                  hintText:"E-MAİL",
                  border:InputBorder.none,
                ),
              ),
                ),
                

              ),
              ),
              SizedBox(height:20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child:Container(
                decoration:BoxDecoration(
                  color:Colors.grey[200],
                  border:Border.all(color:Colors.white),
                  borderRadius:BorderRadius.circular(12),
                ),
                child:Padding(
                padding:const EdgeInsets.only(left:20.0),
                child:TextField(
                controller:ref.read(loginRiverpod).password,
                decoration:const InputDecoration(
                  hintText:"Password",
                  border:InputBorder.none,
                ),
              ),
              ),
                

              ),
              ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                  width:MediaQuery.of(context).size.width/1.05,
                  
                  child:ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    primary:Colors.deepPurple[600],
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(10.0),
                    ),
                    padding:EdgeInsets.all(20),
                  ),
                  onPressed: ()async {
                  await ref.read(loginRiverpod).fetch(context);
                  } ,
                  child:const Text("Sign In",
                  style:TextStyle(
                    color:Colors.white,
                    fontWeight:FontWeight.bold,
                    fontSize:18,
                  ),
                  ),
                  ),
                  ),

                  SizedBox(
                    height:20,
                  ),
                  
                
              
            
              SizedBox(
                width:MediaQuery.of(context).size.width/1.05,
                child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    primary:Colors.deepPurple[600],
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(10.0),
                    ),
                    padding:EdgeInsets.all(20),
                  ),

                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder:((context) => Register())));
                  
                  } ,
                  child:const Text("REGISTER",
                  style:TextStyle(
                    color:Colors.white,
                    fontWeight:FontWeight.bold,
                    fontSize:18,

                  ),
                  ),
                  ),
              ),
                ],
              ),
              
   

            ],
            ),
        
          ),
    );
  }


}

