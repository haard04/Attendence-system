import 'package:attendence/models/attendence.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class attendenceWidget extends StatelessWidget {
  
   attendenceWidget(Attendence attendence,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Attendence attendence=Attendence(name: 'name', teacherLocation: TeacherLocation(longitude: 72.4259566, lattitude: 23.0278803));


    GeolocatorPlatform geolocator = GeolocatorPlatform.instance;
      double latitude=0;
      double longitude=0;
    Future<void> getUserLocation() async {
    try {
      Position userLocation = await geolocator.getCurrentPosition();
      latitude = userLocation.latitude;
      longitude = userLocation.longitude;
      
      // Use latitude and longitude in your emergency signal or message.
      print("Latitude: $latitude, Longitude: $longitude");

    } 
    catch (e) {
      // Handle errors, such as when the user denies location permission.
      print("Error getting location: $e");
      throw e;
    }
  }
    void markAttendence() async {
      await getUserLocation();

      longitude = double.parse(longitude.toStringAsFixed(3));
      latitude = double.parse(latitude.toStringAsFixed(3));

      if((attendence.teacherLocation.lattitude -latitude) + (attendence.teacherLocation.longitude -longitude) >=0.001)
      {
        print('Absent');

      }
      else{
        print('Present');
      }

    }

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text('Class Name:SOftware ENGG')
            ],
          ),
          Row(
            children: [
              Text('Faculty Name: '),

            ],
          ),
          Row(
            children: [
              Text('Student Roll Number'),
            ],
          ),
          Row(
            children: [
              Text('Due Time:'),
            ],
          ),
          Row(
            children: [
              ElevatedButton(onPressed: markAttendence, child: Text('Mark Present'))
            ],
          )

        ],
      )
    );
  }
}