import 'dart:convert';

Model infoFromJson(String str) => Model.fromJson(json.decode(str));
String infoToJson(Model data) => json.encode(data.toJson());

class Model {
  String name;
  int age ;
  int count ;
  
  Model({
    required this.name,
    required this.age,
    required this.count,
  });
  factory Model.fromJson(Map<String, dynamic> json) => Model(

        name: json["name"],
        age: json["age"],
        count: json["count"],
      );
  Map<String, dynamic> toJson() => {        
        "name": name,
        "age": age,
        "count": count,
        
      };
}

