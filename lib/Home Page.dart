import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Hello, What do you need ?',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.pink[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (user != null)
                  Center(
                    child: Text(
                      user.email!,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.pink[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/RequestPage');
                  },
                  child: Text(
                    'I Need Blood',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/DonatePage');
                  },
                  child: Text(
                    'Donate Blood',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.location_on, color: Colors.pink, size: 50),
                      SizedBox(height: 10),
                      Text(
                        'Nearby donors',
                        style: TextStyle(fontSize: 18, color: Colors.pink[900]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/Bloodbank.png',
                          height: 80,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Blood banks',
                          style: TextStyle(fontSize: 18, color: Colors.pink[900]),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/Hospital.jpg',
                          height: 80,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Hospital',
                          style: TextStyle(fontSize: 18, color: Colors.pink[900]),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink[100],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.pink[900]),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.request_page, color: Colors.pink[900]),
            label: 'Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.pink[900]),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
