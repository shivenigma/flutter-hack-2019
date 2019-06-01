

class Idea {
  String title;
  String desc;
  String tags;

  // author
  String userId;
  String userName;
  String createdTime;


  Idea(this.title, this.desc, this.tags, this.userId, this.userName,
      this.createdTime);

  Map<String, String> toMap() {
    return {'title': title, 'desc': desc, 'tags': tags, 'userId': userId, 'userName': userName, 'createdTime': createdTime};
  }

}