import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MediCall"),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          ),
        ],
        leading: Icon(Icons.menu),
      ),
      body: ListView(
        children: [
          Padding (
            padding: const EdgeInsets.only(right: 16),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintText: "Search hospital or address",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
            ),

          ),
          // widget for showing Image
          Image.asset(
            "assets/Map.jpg",
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.6,
            fit:BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
