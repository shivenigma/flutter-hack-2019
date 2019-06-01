import 'package:flutter/material.dart';
import 'package:team_up/feed_card.dart';

import 'login/authentication.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen(
      {Key key,
      this.auth,
      this.userId,
      this.onSignedOut,
      this.name,
      this.email})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  final String name;
  final String email;

  @override
  _FeedScreenState createState() => _FeedScreenState(auth, userId, name, email);
}

class _FeedScreenState extends State<FeedScreen> {
  _FeedScreenState(this.auth, this.userId, this.name, this.email);

  final BaseAuth auth;
  final String userId;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ideas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: EdgeInsets.only(bottom: 0.0),
          children: <Widget>[
            FeedCard(
              id: '1',
              title: 'One Idea',
              subTitle:
                  'Can change the world, Can change the world, Can change the world, Can change the world, Can change the world, Can change the world, Can change the world, Can change the world',
            ),
            FeedCard(
              id: '2',
              title: 'One more Idea',
              subTitle:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/create');
          print('$userId');
          print('$name');
          print('$email');
        },
      ),
    );
  }
}
