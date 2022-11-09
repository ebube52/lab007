import 'dart:async';

import 'package:flutter/material.dart';
import 'main.dart';
import 'Grade.dart';


class Grade{
  final String? sid;
  final String? grade;


  Grade({this.sid, this.grade});

}


class GradeShower extends StatefulWidget {
  final String? title;
  const GradeShower({Key? key, this.title}) : super(key: key);

  @override
  State<GradeShower> createState() => GradesModel();
}

class GradesModel extends State<GradeShower> {
  var gradeInsert;
  DateTime rightNow = DateTime.now();
  String _eventName ='';
  String _grade = '';
  String labelText = "SIn";
  @override

  // toMap(){
  //   return (Grade.sid,Grade.grade);
  // }



  // fromMap(){
  //   return (id, sid, grade);
  // }
  Widget build(BuildContext context) {
    DateTime rightNow =DateTime.now();

    return Scaffold(
      appBar: AppBar(title: Text(widget.title!),
      ),
      body: Column(
          children: [


            Text(_eventName),
            TextFormField(

                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'SIN',
                ),
                onChanged: (value) {
                  setState(()
                  {
                    _eventName = value;
                  });
                }
            ),

            Text(_grade),
            TextFormField(


                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Grade',
                ),

                onChanged: (value){
                  setState((){

                    _grade = value;



                  });
                }
            ),
          ]
      ),

    );



  }
}

