import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String url;
  final String fName;
  final String lName;
  final String mail;

  const UserCard({this.url, this.fName, this.lName, this.mail});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(url),
              radius: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fName + " " + lName),
                SizedBox(
                  height: 5,
                ),
                Text(mail),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UnknownCard extends StatelessWidget {
  final String colorName;
  UnknownCard({this.colorName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(colorName),
      ),
    );
  }
}
