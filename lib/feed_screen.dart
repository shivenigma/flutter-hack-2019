import 'package:flutter/material.dart';
import 'package:team_up/FirestoreHelper.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ideas'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/create');

          // to fetch idea feeds
          FirestoreHelper().fetchPostedIdeas().then((list) {
            list.forEach((data) {
              print(data.data);
            });
          });

        },
      ),
    );
  }
}
