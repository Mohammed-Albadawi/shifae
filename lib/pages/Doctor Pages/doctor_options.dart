import 'package:flutter/material.dart';

class Doctor_Options extends StatefulWidget {
  Doctor_Options({Key? key}) : super(key: key);

  @override
  State<Doctor_Options> createState() => _Doctor_OptionsState();
}

class _Doctor_OptionsState extends State<Doctor_Options> {
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
                        Navigator.of(context).pushNamed('patients_requests');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text(
                        'Patients requests',
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

                    // Chating with a Patient Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('chating_section');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text(
                        'Chating with Patient',
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
