
class Attendence{
  final String name;
  final TeacherLocation teacherLocation;


  Attendence({
    required this.name,
    required this.teacherLocation
  });

}

class TeacherLocation{
  final double longitude;
  final double lattitude;

  TeacherLocation({
    required this.longitude,
    required this.lattitude
  });
}