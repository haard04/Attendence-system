import 'package:attendence/API/Auth.dart';
import 'package:flutter/material.dart';
import 'package:attendence/studentLogin.dart';

class StudentSignUp extends StatelessWidget {
  TextEditingController rollNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _signUp(BuildContext context)async {
    String rollNumber = rollNumberController.text;
    String email = emailController.text;
    String password = passwordController.text;
    // await signUpFunction(rollNumber, email, password);
    
    print('Roll Number: $rollNumber');
    print('Email: $email');
    print('Password: $password');

    
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => studentLogin()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Login Sign-Up'),
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
              onPressed: () async{
                _signUp(context);
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () async{
                  

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => studentLogin()),
                );
              },
              child: Text('Already have an account? Log In'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: StudentSignUp()));
