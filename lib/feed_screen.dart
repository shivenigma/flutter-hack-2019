import 'package:flutter/material.dart';
import 'package:team_up/feed_card.dart';

import 'login/authentication.dart';
import 'package:team_up/FirestoreHelper.dart';
import 'package:team_up/Idea.dart';

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
  List<Idea> ideas;
  List<Widget> listItems;
  bool loading = true;
  @override
  void initState() {
    FirestoreHelper().fetchPostedIdeas().then((list) {
      List<Idea> tempIdeas = [];
      List<Widget> tempCards = [];
      list.forEach((data) {
        Idea idea = Idea(
            data['title'],
            data['desc'],
            data['tags'],
            data['isClosedSource'],
            data['userId'],
            data['userName'],
            data['createdTime']);

        tempCards.add(
          FeedCard(idea: idea),
        );
        tempIdeas.add(idea);
      });
      print(tempIdeas.first.toMap());
      setState(() {
        this.ideas = tempIdeas;
        this.listItems = tempCards;
        this.loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ideas'),
        actions: <Widget>[Icon(Icons.filter_list)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: EdgeInsets.only(bottom: 0.0),
          children: loading
              ? [Center(child: CircularProgressIndicator())]
              : this.listItems,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/create', arguments: { 'email' : email, 'userId' : userId});
        },
      ),
    );
  }
}
