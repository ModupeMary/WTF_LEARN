import 'package:flutter/material.dart';
import 'message.dart';
import 'wishes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birthday Wishing App',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Color(0xff2121cd),
        scaffoldBackgroundColor: const Color(0xffffffff),
      ),

      home: const HomePage(),
    );
  }
}

//Stateful widget is used below to track the page selected. It manages the bottom navigation.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const messagePage(), const wishesPage()];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: Color(0XFF2121CD),
        unselectedItemColor: Color(0xffc1c1c1),

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: "Message",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: "Wishes",
          ),
        ],
      ),
    );
  }
}
