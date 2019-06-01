import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String id;
  FeedCard({@required this.id, @required this.title, this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              this.title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(this.subTitle),
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
