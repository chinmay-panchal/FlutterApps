import 'dart:convert';

import 'package:apijson/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() {
    return _HomescreenState();
  }
}

class _HomescreenState extends State<Homescreen> {
  List<PostModel> postList = [];

  Future<List<PostModel>> getPostApi() async {
    final Response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var data = jsonDecode(Response.body.toString());

    if (Response.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(PostModel.fromJson(i as Map<String, dynamic>));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Array of json objects'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context , snapshot){
                if(!snapshot.hasData){
                  return Text('Loading');
                }else {
                  return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index){
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Title' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                              SizedBox(height: 3,),
                              Text(postList[index].title.toString()),
                              SizedBox(height: 5,),
                              Text('Description' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                              SizedBox(height: 3,),
                              // Text('Description\n'+postList[index].body.toString(),),
                              Text(snapshot.data![index].body.toString()),
                            ],
                          ),
                        ),
                      );
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
