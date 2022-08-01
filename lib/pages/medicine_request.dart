import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MedicineRequest());

class MedicineRequest extends StatefulWidget {
  @override
  _MedicineRequestState createState() => _MedicineRequestState();
}

class _MedicineRequestState extends State<MedicineRequest> {
  late GoogleMapController myController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: Stack(
          children: [
            const GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(15.508457, 32.522854),
                zoom: 12,
              ),
            ),
            Card(
              color: Colors.white,
              borderOnForeground: true,
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 98, 136, 117),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: const TextField(
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                        maxLines: null,
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 17, color: Colors.white),
                          hintText: 'Medicine name...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Icon(Icons.add_location),
                          Text(
                            "",
                            style: TextStyle(color: Colors.orangeAccent),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.teal,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
