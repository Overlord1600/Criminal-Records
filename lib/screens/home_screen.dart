import 'package:criminal_records/screens/admin_screen.dart';
import 'package:criminal_records/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int screensIndex = 0;
  List<Widget> screens = [const MainScreen(), const AdminScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: screensIndex,
          onDestinationSelected: (value) {
            setState(() {
              screensIndex = value;
            });
          },
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.search), label: "Search Records"),
            NavigationDestination(icon: Icon(Icons.add), label: "Add records")
          ],
        ),
        key: _scaffoldKey,
        drawer: NavigationDrawer(
          selectedIndex: screensIndex,
          onDestinationSelected: (value) {
            if (value == 0) {
              _scaffoldKey.currentState!.closeDrawer();
              FirebaseAuth.instance.signOut();
            }
          },
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, top: 10),
              child: const Text(
                'Navigation',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            const NavigationDrawerDestination(
                icon: Icon(Icons.logout), label: Text("Log Out"))
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [Expanded(child: screens[screensIndex])],
          ),
        ));
  }
}
