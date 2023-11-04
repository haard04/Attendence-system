
class Attendence{
  final String name;
  final TeacherLocation teacherLocation;
  final List<int> IPaddress;


  Attendence({
    required this.name,
    required this.teacherLocation,
    required this.IPaddress

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