import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mixin_demo/Model/userListResponse.dart';
import 'package:mixin_demo/ReusableWidget/core_components.dart';
import 'package:http/http.dart' as http;

import 'next_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<UserListResponse> getUserList() async {
    var _url = 'https://reqres.in/api/users?page=1';
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      var jsonResponse = response.body;

      UserListResponse userListResponse =
          UserListResponse.fromJson(json.decode(jsonResponse));

      return userListResponse;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mixin Demo"),
        actions: [
          IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NextPage()));
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<UserListResponse>(
          future: getUserList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, i) {
                    return UserCard(
                      mail: snapshot.data.data[i].email,
                      url: snapshot.data.data[i].avatar,
                      fName: snapshot.data.data[i].firstName,
                      lName: snapshot.data.data[i].lastName,
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
