import 'dart:io';
import 'package:finalp/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'BloodBanks.dart';
import 'Donation Page.dart';
import 'Home Page.dart';
import 'Hospitals.dart';
import 'Login Page.dart';
import 'Notification Page.dart';
import 'Profile Page.dart';
import 'Request Page.dart';
import 'Signup Page.dart';
import 'Welcome Page.dart';
import 'AI.dart';

import 'Firebase stub.dart'
if (dart.library.io) 'Firebase Mobile.dart'
if (dart.library.html) 'Firebase Web.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Auth(),
      initialRoute: "/Welcome Page",
      routes: {
        "/Welcome Page": (context) =>VDonateHomePage(),
        "/signup" : (context) => SignUpPage(),
        "/Login" : (context) => LoginPage(),
        "/HomePage" : (context) => HomePage(),
        "/DonatePage" : (context) => DonatePage(),
        "/RequestPage" : (context) => RequestPage(),
        "/HospitalsPage" : (context) => HospitalsPage(),
        "/BloodBanksPage" : (context) => BloodBanksPage(),
        "/ProfilePage" : (context) => ProfilePage(),
        "/NotificationPage" : (context) => NotificationPage(),
        "/AIPage" : (context) => AIPage(),
      },
    );
  }
























}