

class Idea {
  String title;
  String desc;
  String tags;
  bool isClosedSource;

  // author
  String userId;
  String userName;
  var createdTime;


  Idea(this.title, this.desc, this.tags, this.isClosedSource, this.userId, this.userName, this.createdTime);

  Map<String, dynamic> toMap() {
    return {'title': title, 'desc': desc, 'tags': tags, 'isClosedSource': isClosedSource, 'userId': userId, 'userName': userName, 'createdTime': createdTime};
  }

}