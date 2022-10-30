enum Priority{
  important,
  moderate,
  least
}

class Note{
  int? id;
  String title;
  String? description;
  String date;
  //Priority priority=Priority.least;
  // this can be null
 // DateTime dateTime;

  //Note({required this.title, this.description,this.id});


  Note.withId({this.id, required this.title, this.description, required this.date});

  Note.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        date = json['date']

  ;

  Map<String, dynamic> toJson() => {
    //'id' : id,
    'title': title,
    'description': description,
    'date' : date

  };
}
