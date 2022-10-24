

class Note{
  int? id;
  String title;
  String? description;  // this can be null
 // DateTime dateTime;

  //Note({required this.title, this.description,this.id});


  Note.withId({this.id, required this.title, this.description});

  Note.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description']
       // dateTime =json['dateTime']
  ;

  Map<String, dynamic> toJson() => {
    //'id' : id,
    'title': title,
    'description': description,
    //'dateTime' : dateTime
  };
}
