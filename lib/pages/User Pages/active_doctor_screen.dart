import 'package:flutter/material.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';

class ActiveDoctroScreen extends StatefulWidget {
  const ActiveDoctroScreen({Key? key}) : super(key: key);

  @override
  State<ActiveDoctroScreen> createState() => _ActiveDoctroScreenState();
}

class _ActiveDoctroScreenState extends State<ActiveDoctroScreen> {
  List<String> Docotros = [
    'Mohamed ali',
    'khalid osman',
    'omer khalil',
    'Zaynab ahmed'
  ];
  List<String> images = [
    '11.png',
    '12.png',
    '13.png',
    '14.png',
    '15.png',
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: Docotros.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('images/18.jpg'),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('chat_screen');
                        },
                        icon: Icon(Icons.chat),
                        color: Colors.teal,
                      ),
                      title: Text(
                        'Dr. ' + Docotros[index],
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 20,
                        ),
                      ));
                }),
          )
        ],
      ),
    );
  }
}
