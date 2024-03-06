import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
