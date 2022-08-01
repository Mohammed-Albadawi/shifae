import 'package:flutter/material.dart';

class ChatingSection extends StatefulWidget {
  const ChatingSection({Key? key}) : super(key: key);

  @override
  State<ChatingSection> createState() => _ChatingSectionState();
}

class _ChatingSectionState extends State<ChatingSection> {
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
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          children: [
            Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('images/19.jpeg'),
                    ),
                    title: Text("Salim mohamed"),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('chat_screen');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
