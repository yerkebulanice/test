import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String accessToken;
  const Home({super.key, required this.accessToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Success Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'YOU SUCCESSFULLY SIGNED IN(your token): $accessToken',
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
