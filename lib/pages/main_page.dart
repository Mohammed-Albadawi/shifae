import 'package:flutter/material.dart';

class Main_page extends StatefulWidget {
  const Main_page({Key? key}) : super(key: key);

  @override
  State<Main_page> createState() => _Main_pageState();
}

class _Main_pageState extends State<Main_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        body: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Form(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('patients_services');
                        },
                        color: Colors.white,
                        textColor: Colors.white,
                        child: const Text(
                          'User',
                          style: TextStyle(
                            color: Colors.teal,
                            fontFamily: 'Cairo',
                            fontSize: 23,
                          ),
                        ),
                        padding: EdgeInsets.all(40),
                        shape: CircleBorder(),
                      ),

                      const SizedBox(
                        height: 35,
                      ),

                      // Doctor Button
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('id_dcoctor');
                        },
                        color: Colors.white,
                        textColor: Colors.white,
                        child: const Text(
                          'Doctor',
                          style: TextStyle(
                            color: Colors.teal,
                            fontFamily: 'Cairo',
                            fontSize: 23,
                          ),
                        ),
                        padding: EdgeInsets.all(40),
                        shape: CircleBorder(),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
