import 'package:flutter/material.dart';
import 'package:team_up/Idea.dart';

class FeedCard extends StatelessWidget {
  final Idea idea;
  FeedCard({@required this.idea});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              this.idea.title == null ? '' : this.idea.title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(this.idea.desc == null ? '' : this.idea.desc),
          ),
          ButtonTheme.bar(
            child: ButtonBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.thumb_up),
                  onPressed: () {
                    // this.id
                  },
                ),
                /*FlatButton(
                  child: Icon(Icons.thumb_down),
                  onPressed: () {},
                ),*/
                FlatButton(
                  child: Icon(Icons.add_comment),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text(
                    'Join',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
