import 'package:attendence/attendencewidget.dart';
import 'package:attendence/models/attendence.dart';
import 'package:flutter/material.dart';

class studentsHome extends StatelessWidget {
  
  studentsHome({Key? key}) : super(key: key);
  
  

  @override
  Widget build(BuildContext context) {
    Attendence attendence=Attendence(name:"haard",teacherLocation: TeacherLocation(longitude: 101011, lattitude: 10101),IPaddress: [10,1,12,12]);
    
    return Scaffold(
      appBar: AppBar(title: Text('Active Attendece'),),
      body:Container(
        child:SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child:Column(
          children: [
            attendenceWidget(attendence),
            attendenceWidget(attendence),
            attendenceWidget(attendence),
            attendenceWidget(attendence),
            attendenceWidget(attendence),
            attendenceWidget(attendence),
            attendenceWidget(attendence),

          ],
        )
        ),
        
        
      )
    );
  }
}