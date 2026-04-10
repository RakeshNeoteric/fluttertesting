import 'package:flutter/material.dart';

class Hotel extends StatefulWidget {
  const Hotel({super.key});

  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.arrow_back),
            hintText: 'Search location',
            suffixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.blue[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (value) {
            // Handle search logic here if needed
            setState(() {
              // Update the UI with new search results or filtered locations
            });
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recent Searches Section
            Text(
              'Recent Searches',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.red),
              title: Text('Hyderabad'),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.red),
              title: Text('Chennai'),
            ),
            SizedBox(height: 20),

            // Popular Searches Section
            Text(
              'Popular Searches',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.red),
              title: Text('Delhi'),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.red),
              title: Text('Manali'),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.red),
              title: Text('Mumbai'),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.red),
              title: Text('Bengaluru'),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.red),
              title: Text('Goa'),
            ),
          ],
        ),
      ),
    );
  }
}
