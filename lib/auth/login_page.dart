import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login_at_google_accoun extends StatefulWidget {
  @override
  _Login_at_google_accounState createState() => _Login_at_google_accounState();
}

class _Login_at_google_accounState extends State<Login_at_google_accoun> {
  bool spinner = false;

  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future signInFunction() async {
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return;
    }
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    DocumentSnapshot userExist =
        await firestore.collection('users').doc(userCredential.user!.uid).get();

    if (userExist.exists) {
      print("User Already Exists in Database");
    } else {
      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': userCredential.user!.email,
        'name': userCredential.user!.displayName,
        'image': userCredential.user!.photoURL,
        'uid': userCredential.user!.uid,
        'date': DateTime.now(),
      });
    }

    Navigator.of(context).pushNamed('main_page');

    setState(() {
      spinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 90.0),
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('images/16.jpg'),
                        )),
                  ),
                ),
                const Text(
                  "SHEFAEE",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo'),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        spinner = true;
                      });
                      await signInFunction();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png',
                          height: 36,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Sign in With Google",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.teal[400]),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 12))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
