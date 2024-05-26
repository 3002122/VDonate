import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Notification', style: TextStyle(fontSize: 24)),
              Text('See received blood requests and request status', style: TextStyle(fontSize: 14)),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Received Requests(2)'),
              Tab(text: 'My Request(2)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RequestList(),
            RequestList(), // You can create a different widget for "My Request" if needed.
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {

                    },
                    child: Text('Back')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ProfilePage');
                    },
                    child: Text('Next')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RequestList extends StatelessWidget {
  final List<Map<String, String>> requests = [
    {'bloodType': 'AB+', 'name': 'Sara', 'age': '21', 'phone': '01235894675', 'status': 'Pending Request'},
    {'bloodType': 'O-', 'name': 'Karim', 'age': '30', 'phone': '01001148227', 'status': 'Accept'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final request = requests[index];
        return RequestCard(request: request);
      },
    );
  }
}

class RequestCard extends StatelessWidget {
  final Map<String, String> request;

  RequestCard({required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.bloodtype, size: 40, color: Colors.red),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${request['bloodType']} ${request['name']}, ${request['age']}yr old', style: TextStyle(fontSize: 18)),
                    Text(request['phone']!, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.call, color: Colors.red),
                  onPressed: () {
                    // Handle call action
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(request['status']!),
                ),
                if (request['status'] == 'Pending Request')
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Cancel'),
                  )
                else if (request['status'] == 'Accept')
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Share'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}