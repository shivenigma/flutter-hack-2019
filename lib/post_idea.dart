import 'package:flutter/material.dart';
import 'package:team_up/FirestoreHelper.dart';
import 'package:team_up/Idea.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostIdeaPage extends StatefulWidget {
  
  var arguments;
  
  PostIdeaPage(this.arguments);

  @override
  State<StatefulWidget> createState() {
    return _PostIdeaPageState(arguments);
  }
}

class _PostIdeaPageState extends State<PostIdeaPage> {
  var userDetail;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'tags': null,
    'toggle': false
  };
  //TextEditingController _textFieldController = TextEditingController();

  _PostIdeaPageState(this.userDetail);

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Title',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(fontSize: 20),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter a valid title';
        }
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Description',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          labelStyle: TextStyle(fontSize: 20)),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter description';
        }
      },
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildToggleSwitchField() {
    return Switch(
      value: _formData['toggle'],
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.green,
      onChanged: (value) {
        _formData['toggle'] = value;
      },
    );
  }

  Widget _buildTagField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Tags',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          labelStyle: TextStyle(fontSize: 20)),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter tags';
        }
      },
      onSaved: (String value) {
        _formData['tags'] = value;
      },
    );
  }

  Widget _submitButtonField() {
    return RaisedButton(
      onPressed: _submitForm,
      textColor: Colors.white,
      color: Colors.red,
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        "Submit",
      ),
    );
  }

  void _submitForm() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    print('_formData');
    print(_formData);

    new FirestoreHelper().postIdea(new Idea(_formData['title'], _formData['description'], _formData['tags'], _formData['toggle'], userDetail['userId'], userDetail['email'], FieldValue.serverTimestamp()));

    /*Map<String, dynamic> response;
    response = await postIdea(_formData);
    if (response['success']) {
      // Navigator.pushReplacementNamed(context, '/');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('An Error Occurred!'),
            content: Text(response['message']),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create'),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      _buildTitleTextField(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildDescriptionTextField(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildTagField(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildToggleSwitchField(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _submitButtonField()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
