import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:team_up/FirestoreHelper.dart';
import 'package:team_up/Idea.dart';

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

  bool _isLoading;

  _PostIdeaPageState(this.userDetail);

  Widget _buildTitleTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
            labelText: 'Title',
            alignLabelWithHint: true,
            labelStyle: TextStyle(color: Colors.purpleAccent)),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please enter a valid title';
          }
        },
        onSaved: (String value) {
          _formData['title'] = value;
        },
      ),
    );
  }

  Widget _buildDescriptionTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: TextFormField(
        minLines: 1,
        maxLines: 20,
        decoration: InputDecoration(
            labelText: 'Description',
            labelStyle: TextStyle(color: Colors.purpleAccent)),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please enter description';
          }
        },
        onSaved: (String value) {
          _formData['description'] = value;
        },
      ),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'Tags',
            labelStyle: TextStyle(color: Colors.purpleAccent)),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please enter tags';
          }
        },
        onSaved: (String value) {
          _formData['tags'] = value;
        },
      ),
    );
  }

  Widget _submitButtonField() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
        child: SizedBox(
          height: 50.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.deepPurple,
            child: new Text('Create',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: _submitForm,
          ),
        ));
  }

  Widget _showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 60.0,
          child: Image.asset('assets/app_logo_login.png'),
        ),
      ),
    );
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  void _submitForm() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });

    _formKey.currentState.save();
    print('_formData');
    print(_formData);
    new FirestoreHelper()
        .postIdea(new Idea(
            _formData['title'],
            _formData['description'],
            _formData['tags'],
            _formData['toggle'],
            userDetail['userId'],
            userDetail['email'],
            FieldValue.serverTimestamp()))
        .then((data) {
      setState(() {
        _isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Post Idea'),
        ),
        body: Stack(
          children: <Widget>[
            _showBody(),
            _showCircularProgress(),
          ],
        ));
  }

  @override
  void initState() {
    _isLoading = false;
    super.initState();
  }

  Widget _showBody() {
    return new Container(
        padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              _showLogo(),
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildTagField(),
              _submitButtonField()
            ],
          ),
        ));
  }
}
