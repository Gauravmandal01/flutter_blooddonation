import 'package:blooddonation_project/profile.dart';
import 'package:blooddonation_project/receivedrequest.dart';
import 'package:blooddonation_project/searchdonor.dart';
import 'package:flutter/material.dart';

class MyRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Find Donor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchDonor()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ReceivedRequest()), // Navigate to Request screen
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Profile()), // Navigate to Request screen
            );
          }
        },
      ),
      appBar: AppBar(
        title: Text('Notification'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'See received blood requests and request status',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 16),
            TabBarViewLayout(),
          ],
        ),
      ),
    );
  }
}

class TabBarViewLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.redAccent,
            tabs: [
              Tab(text: 'Received Requests(6)'),
              Tab(text: 'My Request(5)'),
            ],
          ),
          Container(
            height: 400, // Adjust this height as per your design
            child: TabBarView(
              children: [
                // First tab: Placeholder for Received Requests
                Center(
                  child: Text('Received Requests(6)'),
                ),
                // Second tab: My Requests
                ListView(
                  children: [
                    RequestStatusCard(
                      name: 'Divya',
                      age: '21',
                      gender: 'Female',
                      bloodType: 'AB+',
                      location: 'Morbi, Gujarat',
                      hospital: 'Glocal Hospital, Patna',
                      distance: '3 Km',
                      status: 'Request pending',
                      statusColor: Colors.red,
                      buttonText: 'Cancel',
                      showInfoButton: false,
                    ),
                    RequestStatusCard(
                      name: 'Rohan',
                      age: '21',
                      gender: 'Male',
                      bloodType: 'AB+',
                      location: 'Nasik, Mumbai',
                      hospital: 'Alaxia Hospital, Lucknow',
                      distance: '3 Km',
                      status: 'Request accepted',
                      statusColor: Colors.orange,
                      buttonText: 'Donor info',
                      showInfoButton: true,
                    ),
                    RequestStatusCard(
                      name: 'Anjali',
                      age: '18',
                      gender: 'Female',
                      bloodType: 'AB+',
                      location: 'Kota, Rajasthan',
                      hospital: 'MG Hospital, Mumbai',
                      distance: '3 Km',
                      status: 'Request accepted',
                      statusColor: Colors.orange,
                      buttonText: 'Donor info',
                      showInfoButton: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RequestStatusCard extends StatelessWidget {
  final String name;
  final String age;
  final String gender;
  final String bloodType;
  final String location;
  final String hospital;
  final String distance;
  final String status;
  final Color statusColor;
  final String buttonText;
  final bool showInfoButton;

  const RequestStatusCard({
    required this.name,
    required this.age,
    required this.gender,
    required this.bloodType,
    required this.location,
    required this.hospital,
    required this.distance,
    required this.status,
    required this.statusColor,
    required this.buttonText,
    required this.showInfoButton,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.bloodtype, color: Colors.redAccent),
                SizedBox(width: 10),
                Text(
                  '$gender, $age yr old',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.person, color: Colors.grey),
                SizedBox(width: 10),
                Text(name),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey),
                SizedBox(width: 10),
                Text(location),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.directions_walk, color: Colors.grey),
                SizedBox(width: 10),
                Text(distance),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.local_hospital, color: Colors.grey),
                SizedBox(width: 10),
                Text(hospital),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 12,
                      color: statusColor,
                    ),
                    SizedBox(width: 8),
                    Text(
                      status,
                      style: TextStyle(color: statusColor, fontSize: 14),
                    ),
                  ],
                ),
                showInfoButton
                    ? Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: Text(buttonText),
                          ),
                        ],
                      )
                    : ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                        child: Text(buttonText),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
