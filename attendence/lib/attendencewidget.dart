import 'package:attendence/models/attendence.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';

class attendenceWidget extends StatelessWidget {
  
   attendenceWidget(Attendence attendence,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int ip0=0;
    int ip1=0;


bool isWithin10Meters(double originalLat, double originalLng, double newLat, double newLng) {
  const double earthRadius = 6371000; // Radius of the Earth in meters (mean value)

  double degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  double dLat = degreesToRadians(newLat - originalLat);
  double dLng = degreesToRadians(newLng - originalLng);
  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(degreesToRadians(originalLat)) * cos(degreesToRadians(newLat)) * sin(dLng / 2) * sin(dLng / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  double distance = earthRadius * c; // Distance in meters

  return distance <= 10; // Check if the distance is within 10 meters
}

double degreesToRadians(double degrees) {
  return degrees * pi / 180;
}


    Future<void> printIps() async {
  for (var interface in await NetworkInterface.list()) {
    if (interface.name == 'wlan0') {
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4) {
          print('IP Address: ${addr.rawAddress}');
           ip0=addr.rawAddress[0];
           ip1=addr.rawAddress[1];
        }
      }
      break; // Exit the loop after finding the Wi-Fi interface
    }
  }
}

    Attendence attendence=Attendence(name: 'name', teacherLocation: TeacherLocation(longitude: 72.4259566, lattitude: 23.0278803),IPaddress: [10,1,12,45]);


    GeolocatorPlatform geolocator = GeolocatorPlatform.instance;
      double latitude=0;
      double longitude=0;
    Future<void> getUserLocation() async {
    try {
      Position userLocation = await geolocator.getCurrentPosition();
      latitude = userLocation.latitude;
      longitude = userLocation.longitude;
      
      print("Latitude: $latitude, Longitude: $longitude");

    } 
    catch (e) {
      print("Error getting location: $e");
      throw e;
    }
  }
    void markAttendence() async {
      await getUserLocation();
      await printIps();
      // longitude = double.parse(longitude.toStringAsFixed(3));
      // latitude = double.parse(latitude.toStringAsFixed(3));

      if(isWithin10Meters(attendence.teacherLocation.lattitude, attendence.teacherLocation.longitude, latitude, longitude) && ip1==ip1 && ip0==ip0)
      {
        print('Present');
        AwesomeDialog(
          context: context,
          animType: AnimType.SCALE,
          dialogType: DialogType.success,
          title: 'Attendence Marked',
          desc:   'Thank you for attending class',
          btnOkOnPress: () {},
        ).show();
        

      }
      else{
        print('Absent');
        AwesomeDialog(
          context: context,
          animType: AnimType.SCALE,
          dialogType: DialogType.error,
          title: 'Attendence Failed',
          desc:   'It looks like you are trying from outside ',
          btnOkOnPress: () {},
        ).show();
      }

      print(isWithin10Meters(attendence.teacherLocation.lattitude, attendence.teacherLocation.longitude, latitude, longitude));

    }

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Class Name:SOftware ENGG')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Faculty Name: '),
          
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Student Roll Number'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Due Time:'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton(onPressed: markAttendence, child: Text('Mark Present'))
              ],
            ),
          )

        ],
      )
    );
  }
}