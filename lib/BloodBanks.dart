import 'package:flutter/material.dart';

void main() {
  runApp(BloodBankApp());
}

class BloodBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BloodBanksPage(),
    );
  }
}

class BloodBanksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BloodBanks Page'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            BloodBankCard(
              BloodBankName: 'BloodBank 1',
              bloodGroups: 'O, A',
            ),
            SizedBox(height: 16),
            BloodBankCard(
              BloodBankName: 'BloodBank 2',
              bloodGroups: 'O, AB',
            ),
            SizedBox(height: 16),
            BloodBankCard(
              BloodBankName: 'BloodBank 3',
              bloodGroups: 'AB, B',
            ),
          ],
        ),
      ),
    );
  }
}

class BloodBankCard extends StatelessWidget {
  final String BloodBankName;
  final String bloodGroups;

  BloodBankCard({required this.BloodBankName, required this.bloodGroups});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/Bloodbank.png', // Add your hospital icon image to the assets folder
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      BloodBankName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Blood Group: $bloodGroups',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('HotLine'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Location'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/NotificationPage');
                  },
                  child: Text('Next'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
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
