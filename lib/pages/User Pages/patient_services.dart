import 'package:flutter/material.dart';

class Patient_services extends StatefulWidget {
  Patient_services({Key? key}) : super(key: key);

  @override
  State<Patient_services> createState() => _Patient_servicesState();
}

class _Patient_servicesState extends State<Patient_services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[500],
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
        padding: const EdgeInsets.only(
          top: 100.0,
        ),
        child: Column(
          children: [
            const Text(
              'Patient Services',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontFamily: "Cairo",
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Request Doctor Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('doctor_form_request');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text(
                        'Doctor Request',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cairo',
                          fontSize: 23,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    // Consultation Doctor Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('list_of_doctors_sections_page');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text(
                        'Doctor Consultation',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cairo',
                          fontSize: 23,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    // Medicine Request Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('medicine_request');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text(
                        'Medicine Request',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cairo',
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
