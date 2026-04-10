import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avoota'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.more_vert),
        //     color: Colors.black,
        //     onPressed: () {},
        //   )
        // ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Section
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.blue[50],
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage(
                        'assets/profile.png'), // Replace with your asset
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Username',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('90XXXXXXXX'),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      // Handle profile edit action
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Toolkit Section
            ListTile(
              leading: Icon(Icons.book),
              title: Text('View/Manage Bookings'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle booking management
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('Wishlist'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle wishlist
              },
            ),

            Divider(),

            // Payment Info Section
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Saved Cards'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle saved cards
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('UPI'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle UPI payments
              },
            ),

            Divider(),

            // Settings Section
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Account & Devices'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle account settings
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Sets "Profile" as the selected item
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }
}
