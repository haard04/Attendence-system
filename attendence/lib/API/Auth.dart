import 'package:http/http.dart' as http;

Future<HttpResponse> logInFINAL(String rollNo, String email, String password) async {
  print('Service $rollNo, $email, $password');
  
  final response = await http.post(
    Uri.parse('https://ssipbackend.onrender.com/api/student/signup'),
    body: {
      'student_rollno': rollNo,
      'student_email': email,
      'student_password': password,
    },
  );

  print(response.statusCode);

  // Handle the response here, return an instance of HttpResponse with the relevant data
  return HttpResponse(statusCode: response.statusCode, body: response.body);
}

class HttpResponse {
  final int statusCode;
  final String body;

  HttpResponse({required this.statusCode, required this.body});
}
