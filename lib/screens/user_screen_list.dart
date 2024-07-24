// lib/screens/user_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../models/user_model.dart';

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
        title: Text('User List'),
      ),
      body: userProvider.isLoading && userProvider.users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : userProvider.errorMessage != null
              ? Center(child: Text(userProvider.errorMessage!))
              : ListView.builder(
                  itemCount: userProvider.users.length,
                  itemBuilder: (context, index) {
                    final user = userProvider.users[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    );
                  },
                ),
    );
  }
}
