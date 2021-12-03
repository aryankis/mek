import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class User {
  int userId;
  int id;
  String title;
  String body;

  User({this.body, this.id, this.title, this.userId});

  factory User.formJson(Map<String, dynamic> json) {
    return User(
        userId: json['userId'],
        body: json['body'],
        id: json['id'],
        title: json['title']);
  }
}

class _DemoState extends State<Demo> {
  List apiResponse;

  @override
  Future<List<User>> fetchUser() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/posts");
    apiResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      print(apiResponse[0]["title"]);

      return apiResponse.map((e) => new User.formJson(e)).toList();
    } else {
      print("error");
      return null;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: fetchUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<User> user = snapshot.data;
              print(snapshot.data);
              return ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Column(
                    children: [
                      // Text(user[index].["id"].toString()),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(user[index].body)),
                      Text(user[index].id.toString())
                    ],
                  ));
                },
              );
            }
            // return ListView.builder(
            //   itemCount: apiResponse.length,
            //   itemBuilder: (context, index) {
            //     return Card(
            //         child: Column(
            //       children: [
            //         Text(apiResponse[index]["id"].toString()),
            //         Text(apiResponse[index]["body"]),
            //       ],
            //     ));
            //   },
            // );
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
