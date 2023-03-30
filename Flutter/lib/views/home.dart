import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/riverpod/riverpod_managment.dart';
import 'package:flutter_application_2/riverpod/word_riverpod.dart';
import 'package:flutter_application_2/service/service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/word_model.dart';
import 'package:http/http.dart' as http;

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int index = 0;

  WordRiverpod word = new WordRiverpod();
  Service service = new Service();
  
  var lenght;


  String name = "ege";

  @override
  Widget build(BuildContext context) {
    print("state calıstı");

    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          "TRY TO GUESS THE ARTICLE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: FutureBuilder<WordModel?>(
                future: service.WordCall(),
                initialData: null,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    
                      lenght=snapshot.data?.data.length;

                      if(index==lenght){

                        return Text(
                        "END OF THE WORDS",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      );


                      }
                      else {
                        var result = snapshot.data?.data[index].word;


                      return Text(
                        result!,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      );

                      }

                       
                    
                  } else if (snapshot.hasError) {
                    return Text('An error occurred');
                  } else {
                    return Text('No data returned from API');
                  }
                }),
                
          ),
          SizedBox(
            height: 250,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(20),
                ),
                onPressed: () async {
                  await ref.read(wordRiverpod).control("der", index, context);

                  index++;
                  setState(() {});
                },
                child: const Text(
                  "Der",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(20),
                ),
                onPressed: () async {
                  await ref.read(wordRiverpod).control("die", index, context);
                  index++;
                  print(index);

                  setState(() {});
                },
                child: const Text(
                  "Die",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(20),
                ),
                onPressed: () async {
                  await ref.read(wordRiverpod).control("das", index, context);
                  index++;
                  setState(() {});
                },
                child: const Text(
                  "Das",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
