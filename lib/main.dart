import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firsto_ne_app/auth/login_page.dart';
import 'package:firsto_ne_app/pages/Doctor Pages/Doctor_IdCode.dart';
import 'package:firsto_ne_app/pages/User Pages/active_doctor_screen.dart';
import 'package:firsto_ne_app/pages/Doctor Pages/chating_section.dart';
import 'package:firsto_ne_app/pages/Doctor Pages/doctor_options.dart';
import 'package:firsto_ne_app/pages/User Pages/list_of_doctors_sections_page.dart';
import 'package:firsto_ne_app/pages/main_page.dart';
import 'package:firsto_ne_app/pages/User Pages/patient_services.dart';
import 'package:firsto_ne_app/pages/User Pages/doctor_form_request.dart';
import 'package:firsto_ne_app/pages/Doctor Pages/patients_requests.dart';
import 'package:flutter/material.dart';
import 'pages/chat_screen.dart';
import 'pages/medicine_request.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _auth.currentUser != null
          ? const Main_page()
          : Login_at_google_accoun(),
      routes: {
        "login_at_google_account": (context) => Login_at_google_accoun(),
        "main_page": (context) => const Main_page(),
        "patient_services": (context) => Patient_services(),
        "doctor_form_request": (context) => Doctor_Request(),
        "list_of_doctors_sections_page": (context) => ListOfDoctorsSections(),
        "active_doctor_screen": (context) => ActiveDoctroScreen(),
        "chat_screen": (context) => ChatScreen(),
        "id_dcoctor": (context) => IdDoctor(),
        "doctor_options": (context) => Doctor_Options(),
        "patients_services": (context) => Patient_services(),
        "patients_requests": (context) => Patients_Requests(),
        "chating_section": (context) => ChatingSection(),
        "medicine_request": (context) => MedicineRequest(),
      },
    );
  }
}
