import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'control.dart';

final _firestore = FirebaseFirestore.instance;
late User signedInUser; //this will give us email;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextControler = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.teal[500],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/14.png', height: 25),
            SizedBox(width: 10),
            Text('MessageMe')
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.of(context).pushNamed('login_at_google_account');
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStreamBuilder(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      // The TextField
                      child: TextField(
                        controller: messageTextControler,
                        onChanged: (value) {
                          messageText = value;
                        },
                        style: const TextStyle(
                            color: Colors.white, fontSize: 18.0),
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 17, color: Colors.white),
                          hintText: 'Type a message...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        messageTextControler.clear();
                        _firestore.collection('messages').add(
                          {
                            'text': messageText,
                            'sender': signedInUser.email,
                            'time': FieldValue.serverTimestamp(),
                          },
                        );
                      },
                      child: Text(
                        'send',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// message StreamBuilder STL
class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('time').snapshots(),
      builder: (context, snapshot) {
        List<MessageLine> messageWidgets = [];

        if (snapshot.hasData) {
          final Mymessages = snapshot.data!.docs.reversed;

          for (var message in Mymessages) {
            final messageText = message.get('text');
            final messagesender = message.get('sender');
            final currentUser =
                signedInUser.email; // تعطينا ايميل المستخدم الحالي

            final messageWidget = MessageLine(
              sender: messagesender,
              text: messageText,
              isMe: currentUser == messagesender,
            );
            messageWidgets.add(messageWidget);
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(backgroundColor: Colors.teal),
          );
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}

// messageLine STL
class MessageLine extends StatelessWidget {
  const MessageLine({this.sender, this.text, required this.isMe, Key? key})
      : super(key: key);

  final String? sender;
  final String? text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            '$sender',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black45,
            ),
          ),
          Material(
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            elevation: 6,
            color: isMe ? Colors.blue[400] : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                '$text',
                style: TextStyle(
                  fontSize: 15.0,
                  color: isMe ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
