 

import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  UserDetailsScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name}'),
            Divider(),  

            SizedBox(height: 8),

            Text('Email: ${user.email}'),
            Divider(),  

            SizedBox(height: 8),

            Text('Phone: ${user.phone}'),
            Divider(),  

            SizedBox(height: 8),

            Text('Website: ${user.website}'),
            Divider(),  

            SizedBox(height: 8),

            Text('Address:'),
            Divider(),  

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Street: ${user.address.street}'),
                  Divider(),  
                  Text('Suite: ${user.address.suite}'),
                  Divider(), 
                  Text('City: ${user.address.city}'),
                  Divider(),  
                  Text('Zipcode: ${user.address.zipcode}'),
                ],
              ),
            ),

            SizedBox(height: 8),

            Text('Company:'),
            Divider(),  

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${user.company.name}'),
                  Divider(), 
                  Text('Catch Phrase: ${user.company.catchPhrase}'),
                  Divider(),  
                  Text('Business: ${user.company.bs}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
