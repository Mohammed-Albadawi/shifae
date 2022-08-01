import 'package:firsto_ne_app/pages/control.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Doctor_Request extends StatefulWidget {
  Doctor_Request({Key? key}) : super(key: key);

  @override
  State<Doctor_Request> createState() => _Doctor_RequestState();
}

class _Doctor_RequestState extends State<Doctor_Request> {
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
      body: (Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 8, 134, 122),
            Color.fromARGB(255, 116, 143, 140)
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            const Expanded(
              flex: 1,
              child: Text(
                'Patient Form',
                style: TextStyle(
                    fontSize: 30.0, color: Colors.white, fontFamily: "Cairo"),
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            patient_name = value;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Patisent Name',
                              hintStyle: TextStyle(color: Colors.black38),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)))),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            age = value;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              hintText: 'Age',
                              hintStyle: TextStyle(color: Colors.black38),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)))),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            active_number = value;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              hintText: 'Active Phone Number',
                              hintStyle: TextStyle(color: Colors.black38),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)))),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            address = value;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Address',
                            hintStyle: TextStyle(color: Colors.black38),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Gender :',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    const Text('Male'),
                                    Radio(
                                        activeColor: Colors.teal,
                                        value: 'Male',
                                        groupValue: gender,
                                        onChanged: (val) {
                                          setState(() {
                                            gender = val;
                                          });
                                        })
                                  ],
                                )),
                            Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    const Text('Female'),
                                    Radio(
                                        activeColor: Colors.teal,
                                        value: 'Female',
                                        groupValue: gender,
                                        onChanged: (val) {
                                          setState(() {
                                            gender = val;
                                          });
                                        })
                                  ],
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
