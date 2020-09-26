import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mixin_demo/Model/unknown_list_response.dart';
import 'package:mixin_demo/ReusableWidget/core_components.dart';
import 'package:http/http.dart' as http;

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  Future<UnknownListResponse> getUnknownList() async {
    var _url = 'https://reqres.in/api/unknown';
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      var jsonResponse = response.body;

      UnknownListResponse unknownListResponse =
          UnknownListResponse.fromJson(json.decode(jsonResponse));

      return unknownListResponse;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mixin Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<UnknownListResponse>(
          future: getUnknownList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, i) {
                    return UnknownCard(
                      colorName: snapshot.data.data[i].name,
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
