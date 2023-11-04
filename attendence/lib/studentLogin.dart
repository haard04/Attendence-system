import 'package:attendence/API/Auth.dart';
import 'package:attendence/StudentsHome.dart';
import 'package:attendence/studentsignup.dart';
import 'package:flutter/material.dart';

class studentLogin extends StatelessWidget {

  TextEditingController rollNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   studentLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: rollNumberController,
              decoration: InputDecoration(labelText: 'Roll Number'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: ()async {
                // Implement your login logic here

                // await logInFINAL(rollNumberController.text,emailController.text,passwordController.text);

                Navigator.push(context, MaterialPageRoute(builder: (context) => studentsHome(),));
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StudentSignUp(),));
              },
              child: Text('New user? Sign Up'),
            ),
          ],
        ),
      ),
    );
  
  }
}

