import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/controller/controller.dart';
import 'package:todo_list/screens/home_screen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Controller>(
          create: (context) => Controller(),
        )
      ],
      child: MaterialApp(
        title: 'Todo List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: ('Google'),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
