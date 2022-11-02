
class Note{
  int? id;
  String title;
  String? description;
  String date;
  int priority;


  //Note({required this.title, this.description,this.id});


  Note.withId({this.id, required this.title, this.description, required this.date,required this.priority});

  Note.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        date = json['date'],
        priority= json['priority']

  ;

  Map<String, dynamic> toJson() => {
    //'id' : id,
    'title': title,
    'description': description,
    'date' : date,
    'priority' : priority

  };
}
