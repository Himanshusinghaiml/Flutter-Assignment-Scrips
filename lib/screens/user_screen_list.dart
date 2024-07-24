 

import 'package:flutter/material.dart';
import 'package:flutter_api_integration/screens/user_details.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
 

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    // Fetch data when screen initializes
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      userProvider.fetchUsers();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('User List',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
      ),
      body: userProvider.isLoading && userProvider.users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : userProvider.errorMessage != null
              ? Center(child: Text(userProvider.errorMessage!))
              : ListView.separated(
                  itemCount: userProvider.users.length,
                  separatorBuilder: (context, index) => Divider(height: 0, color: Colors.grey),
                  itemBuilder: (context, index) {
                    final user = userProvider.users[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetailsScreen(user: user),
                          ),
                        );
                      },
                      child: Container(
                        color: Color.fromARGB(31, 97, 95, 96),  
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            Text(user.email, style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
