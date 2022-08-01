import 'package:flutter/material.dart';

class Patients_Requests extends StatefulWidget {
  const Patients_Requests({Key? key}) : super(key: key);

  @override
  State<Patients_Requests> createState() => _Patients_RequestsState();
}

class _Patients_RequestsState extends State<Patients_Requests> {
  final List<String> patients_list = [
    'Mohamed ali',
    'Omer osman',
    'Wali ahmed',
    'Taha khlil',
    'Ahmed sad',
    'Ibrahim hassan'
  ];
  final List<String> address_of_patients = [
    "Khartoum",
    "Bahri",
    "Omdurman",
    "Sharj alnile",
    "Madani",
    "Soba",
  ];

  void _I_accept() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("warning"),
          content: Text(
              "Note that if you press I Accept, you cannot cancel the request"),
          actions: [
            // usually buttons at the bottom of the dialog
            ElevatedButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              child: Text("I Accept"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog(String patisentName, patientAddress) {
    //  defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("patient data"),
          content: Container(
            padding: EdgeInsets.all(8),
            height: 250.0,
            width: 300.0,
            color: Colors.teal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Patient Name : ' + patisentName,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Age : 26',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Gander : Male',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Phone : +249 923445422',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Address : ' + patientAddress,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            // usually buttons at the bottom of the dialog
            ElevatedButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        itemCount: patients_list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            borderOnForeground: true,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("${patients_list[index]}",
                      style:
                          TextStyle(color: Colors.green, fontFamily: 'Cairo')),
                  subtitle: Row(
                    children: [
                      Icon(Icons.add_location),
                      Text(
                        "${address_of_patients[index]}",
                        style: TextStyle(color: Colors.orangeAccent),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text(
                        'Details',
                        style: TextStyle(
                          color: Color.fromARGB(255, 23, 23, 20),
                          fontFamily: 'Cairo',
                        ),
                      ),
                      onPressed: () {
                        _showDialog(
                            patients_list[index], address_of_patients[index]);
                      },
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text(
                        'Accept',
                        style: TextStyle(
                          color: Colors.teal,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      onPressed: () {
                        _I_accept();
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
