import 'package:cloud_firestore/cloud_firestore.dart';

class Grade{
  String? sid;
  String? id;
  double? grade;
  DocumentReference? reference;

  Grade.fromMap(var map, {this.reference}){
    this.sid = map['name'];
    this.id = map['type'];
    this.grade = map['cost'];
  }

  Map<String,Object?> toMap(){
    return {
      'name': this.sid,
      'type': this.id,
      'cost': this.grade,
    };
  }

  String toString(){
    return 'Todo[sid: $sid], [id: $id] , grade: $grade' ;
  }
}