import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
// This widget is the root
// of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "ListView.builder",
        theme: ThemeData(primarySwatch: Colors.teal),
        debugShowCheckedModeBanner: false,
        // home : new ListOfDoctorsSections(),  NO Need To Use Unnecessary New Keyword
        home: ListOfDoctorsSections());
  }
}

class ListOfDoctorsSections extends StatelessWidget {
  List<String> Medical_Specialties = [
    'Cardiology',
    'Ear, nose and throat (ENT)',
    'Elderly services ,department',
    'Gastroenterology',
    'General Surgery',
    'Gynecology',
    'Hematology',
    'Neonatal Unit',
    'Neurology',
    'Nutrition and dietetics',
    'Obstetrics and gynecology units',
    'Oncology',
    'Ophthalmology',
    'Orthopedics',
    'Physiotherapy'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Center(
          child: Row(children: [
            Expanded(
              child: Image.asset(
                'images/16.jpg',
                height: 80,
              ),
            ),
          ]),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: Medical_Specialties.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: Image.asset(
                    'images/14.png',
                    height: 45,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('active_doctor_screen');
                    },
                    icon: Icon(Icons.chat),
                    color: Colors.teal,
                  ),
                  title: Text(Medical_Specialties[index]));
            }),
      ),
    );
  }
}
