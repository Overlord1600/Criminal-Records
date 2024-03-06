import 'package:criminal_records/screens/information.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GetIt repo = GetIt.instance;
  Map<String, String> dataMatch = {
    "Name": "",
    "Gender": "",
    "DateOfBirth": "",
    "State": "",
    "Aadhar": "",
    "Crime": ""
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      //   resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Search for criminal records",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Aadhar number and Name are mandatory required fields",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      "Please enter a value";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    dataMatch["Name"] = value.trim();
                  },
                  key: const ValueKey("Username"),
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Enter Name",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.red))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.toString().length > 12) {
                      return "Aadhar number should not exceed or be less than 12 digits";
                    } else if (value!.isEmpty) {
                      "Please enter a value";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    dataMatch["Aadhar"] = value.toString().trim();
                  },
                  key: const ValueKey("Aadhar"),
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Enter Adhaar Card Number",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(155),
                          borderSide: const BorderSide(color: Colors.red))),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownMenu(
                      inputDecorationTheme: InputDecorationTheme(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.red))),
                      width: 360,
                      label: const Text("Select Reason"),
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(
                            value: "Abc", label: "Business Enquiries"),
                        DropdownMenuEntry(value: "Bcd", label: "Employement"),
                        DropdownMenuEntry(value: "Abc", label: "Others")
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   width: double.infinity,
                //   alignment: Alignment.centerLeft,
                //   child: const Text(
                //     "Optional Records",
                //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // TextFormField(
                //   key: const ValueKey("Age"),
                //   autocorrect: false,
                //   keyboardType: TextInputType.number,
                //   decoration: InputDecoration(
                //       labelText: "Enter Age",
                //       enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: BorderSide(color: Colors.white)),
                //       disabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: BorderSide(color: Colors.white)),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: BorderSide(color: Colors.white)),
                //       errorBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: const BorderSide(color: Colors.red)),
                //       focusedErrorBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: const BorderSide(color: Colors.red))),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // TextFormField(
                //   key: const ValueKey("Gender"),
                //   autocorrect: false,
                //   keyboardType: TextInputType.number,
                //   decoration: InputDecoration(
                //       labelText: "Enter Gender",
                //       enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: BorderSide(color: Colors.white)),
                //       disabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: BorderSide(color: Colors.white)),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: BorderSide(color: Colors.white)),
                //       errorBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: const BorderSide(color: Colors.red)),
                //       focusedErrorBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: const BorderSide(color: Colors.red))),
                // ),
                TextFormField(
                  onChanged: (value) {
                    dataMatch["DateOfBirth"] = value.trim();
                  },
                  key: const ValueKey("Date of Birth"),
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Date of Birth",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.red))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    dataMatch["State"] = value.trim();
                  },
                  key: const ValueKey("State of residence"),
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Enter State",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.red))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    dataMatch["Gender"] = value.trim();
                  },
                  key: const ValueKey("Gender"),
                  autocorrect: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Enter Gender",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.red))),
                ),
                Container(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  height: 60,
                  //  color: Colors.amber,

                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.deepPurpleAccent)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                            builder: (context) =>
                                InformationScreen(data: dataMatch),
                          ))
                              .then((value) {
                            dataMatch.clear();
                          });
                          _formKey.currentState!.reset();
                        }
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
