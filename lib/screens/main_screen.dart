import 'package:criminal_records/screens/search_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    "Welcome to \nCriminal Check",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: FlutterLogo(
                      size: 70,
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const SearchScreen();
                  },
                ));
              },
              child: IgnorePointer(
                child: Focus(
                  canRequestFocus: false,
                  child: TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.search),
                        labelStyle: const TextStyle(color: Colors.white),
                        labelText: "Search for Records",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.white)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.white)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.red))),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Criminal Statistics",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: GridView.count(
                    mainAxisSpacing: 0,
                    crossAxisCount:
                        2, // Adjust the cross axis count for more/less columns
                    children: [
                  Container(
                      margin: const EdgeInsets.all(8),
                      width: 150, // Adjust container size as needed
                      height: 150, // Adjust container size as needed
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.grey
                            .withOpacity(0.15), // Change color as needed
                        borderRadius: BorderRadius.circular(
                            20), // Adjust border radius as needed
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: const Icon(
                                Icons.edit_document,
                                size: 30,
                              ),
                            ),
                            Container(
                              child: const Text(
                                "Total Records : \n10",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 25),
                              ),
                            )
                          ],
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.all(8),
                      width: 150, // Adjust container size as needed
                      height: 150, // Adjust container size as needed
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.grey
                            .withOpacity(0.15), // Change color as needed
                        borderRadius: BorderRadius.circular(
                            20), // Adjust border radius as needed
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              //padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: const Icon(
                                Icons.browser_updated,
                                size: 30,
                              ),
                            ),
                            Container(
                              child: const Text(
                                "Records updated: \n2",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 25),
                              ),
                            )
                          ],
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.all(8),
                      width: 150, // Adjust container size as needed
                      height: 150, // Adjust container size as needed
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.grey
                            .withOpacity(0.15), // Change color as needed
                        borderRadius: BorderRadius.circular(
                            20), // Adjust border radius as needed
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              //  padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: const Icon(
                                Icons.check_box,
                                size: 30,
                              ),
                            ),
                            Container(
                              child: const Text(
                                "Checks performed : \n7",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 25),
                              ),
                            )
                          ],
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.all(8),
                      width: 150, // Adjust container size as needed
                      height: 150, // Adjust container size as needed
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.grey
                            .withOpacity(0.15), // Change color as needed
                        borderRadius: BorderRadius.circular(
                            20), // Adjust border radius as needed
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              //  padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: const Icon(
                                Icons.update,
                                size: 30,
                              ),
                            ),
                            Container(
                              child: const Text(
                                "Recently added records: 2",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 25),
                              ),
                            )
                          ],
                        ),
                      ))
                ])),
          ],
        ),
      ),
    );
  }
}
