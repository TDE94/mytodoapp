import 'package:flutter/material.dart';

class TodoModel {
  String title;
  String description;
  String isCompleted;
  int id;
  String deadline;

  TodoModel({this.title, this.description, this.deadline, this.isCompleted});
  TodoModel.withId(
      this.title, this.description, this.deadline, this.isCompleted, this.id);
  TodoModel.map(dynamic obj) {
    this.title = obj["title"];
    this.description = obj["description"];
    this.isCompleted = obj["isCompleted"];
    this.id = obj["id"];
    this.deadline = obj["deadline"];
  }
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["title"] = title;
    map["description"] = description;
    map["isCompleted"] = isCompleted;
    map["deadline"] = deadline;

    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  TodoModel.fromMap(Map<String, dynamic> map) {
    this.title = map["title"];
    this.description = map["description"];
    this.isCompleted = map["isCompleted"];
    this.id = map["id"];
    this.deadline = map["deadline"];
  }
}
