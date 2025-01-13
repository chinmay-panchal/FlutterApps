import 'dart:convert';

import 'package:apijson/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() {
    return _ExampleTwoState();
  }
}

class _ExampleTwoState extends State<ExampleTwo> {
  List<photos> photosList = [];

  Future<List<photos>> getPhotos() async {
    final response = await get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      photosList.clear();
      for (Map i in data) {
        photosList.add(photos(title: i['title'], url: i['url'], id: i['id']));
      }
      return photosList;
    } else {
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Array of json Image objects'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotos(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Loading');
                  }
                  return ListView.builder(
                      itemCount: photosList.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          // leading: CircleAvatar(
                          //   // backgroundImage:NetworkImage(snapshot.data![index].url.toString()),
                          //   backgroundImage:
                          //       NetworkImage(photosList[index].url.toString()),
                          // ),
                          subtitle:
                              Text(snapshot.data![index].title.toString()),
                          title: Text(snapshot.data![index].id.toString()),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}

class photos {
  String title, url;
  int id;

  photos({required this.title, required this.url, required this.id});
}
