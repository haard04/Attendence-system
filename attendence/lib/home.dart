import 'package:attendence/studentLogin.dart';
import 'package:attendence/teacherLogin.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => studentLogin(),));
                  }, child: Text('Student')),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => teacherLogin(),));
                  }, child: Text('Teacher')),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}