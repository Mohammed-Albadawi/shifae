import 'package:flutter/material.dart';

class IdDoctor extends StatefulWidget {
  const IdDoctor({Key? key}) : super(key: key);

  @override
  State<IdDoctor> createState() => _IdDoctorState();
}

class _IdDoctorState extends State<IdDoctor> {
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
          image: DecorationImage(
              image: AssetImage('images/4.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),
                BlendMode.darken,
              )),
        ),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/14.png',
                          width: 150,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 50.0),
                          child: const Text(
                            'To make sure you are a doctor, enter your ID CODE',
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                                fontFamily: 'Cairo'),
                          ),
                        ),
                        TextFormField(
                          maxLength: 10,
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.grey),
                            ),
                            hintText: 'Enter Id Code....',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 19.0,
                            ),
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pushNamed('doctor_options');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          label: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          icon: Icon(Icons.send),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          child: Row(
                            children: [
                              const Text(
                                'If you forget code',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                child: const Text(
                                  'Click Here',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                onTap: () {},
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
