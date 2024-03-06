import 'dart:io';

import 'package:criminal_records/backend/repository.dart';
import 'package:criminal_records/screens/loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  
  final ImagePicker picker = ImagePicker();
  XFile? pickedImageFile;
  File? pickedImage;
  void pickImage() async {
    pickedImageFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = File(pickedImageFile!.path);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey1 = GlobalKey<ScaffoldState>();
  Map<String, dynamic> dataMatch = {
    "Name": "",
    "Gender": "",
    "DateOfBirth": "",
    "State": "",
    "Aadhar": "",
    "SearchStatus": "false",
    "Crime": "",
    "Image": ""
  };
  GetIt repo = GetIt.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey1,
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingScreen();
            } else if (snapshot.data == true) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Add criminal record",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Please make sure that all the data entered in correct and legitimate",
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
                            dataMatch["Name"] = value;
                          },
                          key: const ValueKey("Username"),
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: "Enter Name",
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
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.red))),
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
                            dataMatch["Aadhar"] = value;
                          },
                          key: const ValueKey("Aadhar"),
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: "Enter Adhaar Card Number",
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
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(155),
                                  borderSide:
                                      const BorderSide(color: Colors.red))),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              "Please enter a value";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            dataMatch["Crime"] = value;
                          },
                          key: const ValueKey("Crimes"),
                          autocorrect: false,
                          decoration: InputDecoration(
                              labelText: "Enter Criminal Charges",
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
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(155),
                                  borderSide:
                                      const BorderSide(color: Colors.red))),
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              "Please enter a value";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            dataMatch["DateOfBirth"] = value;
                          },
                          key: const ValueKey("Date of Birth"),
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: "Date of Birth",
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
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.red))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              "Please enter a value";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            dataMatch["State"] = value;
                          },
                          key: const ValueKey("State of residence"),
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: "Enter State",
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
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.red))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              "Please enter a value";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            dataMatch["Gender"] = value;
                          },
                          key: const ValueKey("Gender"),
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: "Enter Gender",
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
                                  borderSide:
                                      const BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.red))),
                        ),
                        Container(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(15)),
                          child: pickedImage == null
                              ? TextButton.icon(
                                  onPressed: () {
                                    pickImage();
                                  },
                                  icon: const Icon(Icons.add),
                                  label: const Text("Add Image"))
                              : Image.file(pickedImage as File),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              dataMatch["Image"] = pickedImage;
                              repo
                                  .get<Repository>()
                                  .addRecord(
                                      data: dataMatch,
                                      userId: FirebaseAuth
                                          .instance.currentUser!.uid)
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Record added successfully")));
                                setState(() {
                                  pickedImage = null;
                                });
                              });
                            }
                          },
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Colors.deepPurpleAccent)),
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                        "https://static.vecteezy.com/system/resources/thumbnails/009/759/646/small_2x/eps10-white-danger-notice-or-risk-icon-isolated-on-black-background-danger-alert-symbol-in-a-simple-flat-trendy-modern-style-for-your-website-design-logo-pictogram-and-mobile-application-vector.jpg"),
                    Container(
                      height: 20,
                    ),
                    const Text(
                      "Access Denied",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Container(
                      height: 20,
                    ),
                    const Text(
                      "You need to have admin access to use this feature",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "This feature is only available for users with admin access. You need to have an admin role",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              );
            }
          },
          future: repo
              .get<Repository>()
              .isUserAdmin(userId: FirebaseAuth.instance.currentUser!.uid),
        ));
  }
}
