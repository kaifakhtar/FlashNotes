

class Note{

  String title;
  String? description;  // this can be null
 // DateTime dateTime;

  Note({required this.title, this.description});

  Note.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description']
       // dateTime =json['dateTime']
  ;

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    //'dateTime' : dateTime
  };
}
