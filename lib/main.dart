import 'package:flutter/material.dart';
import 'package:flutter_api_integration/screens/user_screen_list.dart';
import 'package:provider/provider.dart';

import 'providers/user_provider.dart';
 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'Flutter API Integration',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:UserListScreen  (),
      ),
    );
  }
}
