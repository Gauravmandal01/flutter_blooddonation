import 'package:blooddonation_project/profile.dart';
import 'package:blooddonation_project/receivedrequest.dart';
import 'package:blooddonation_project/searchdonor.dart';
import 'package:flutter/material.dart';

class FoundDonor extends StatelessWidget {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.bloodtype, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'B+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        'Rajkot',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            const Text(
              'Found 10 donors around you',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 10, 10, 10),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  donorCard('Female, 21yr old', 'Divya', 'morbi, Gujarat',
                      '3 Km', 'AB+'),
                  donorCard('Male, 21yr old', 'Rohan', 'nasik, Mumbai', '3 Km',
                      'AB+'),
                  donorCard('Female, 18yr old', 'Anjali', 'kota, Rajasthan',
                      '3 Km', 'AB+'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget donorCard(String genderAge, String name, String location,
      String distance, String bloodGroup) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 241, 145, 177),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/bloodLogo1.png',
                  height: 40,
                ),
                SizedBox(width: 10),
                Text(
                  genderAge,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Icon(Icons.location_on, size: 18, color: Colors.black54),
                SizedBox(width: 5),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_searching, size: 18, color: Colors.black54),
                SizedBox(width: 5),
                Text(
                  distance,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image.asset(
                //   'assets/bloodLogo1.png',
                //   height: 40,
                // ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Request ➤'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
