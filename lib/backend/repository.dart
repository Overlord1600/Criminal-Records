import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:criminal_records/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Repository {
  var db = FirebaseFirestore.instance;
  Future<String?> userAuthentication(
      {required data, required AuthenticationMode mode}) async {
    var auth = FirebaseAuth.instance;
    UserCredential result;
    try {
      if (mode == AuthenticationMode.login ||
          mode == AuthenticationMode.adminLogin) {
        result = await auth.signInWithEmailAndPassword(
            email: data['Email'], password: data['Password']);
      } else {
        result = await auth.createUserWithEmailAndPassword(
            email: data['Email'], password: data['Password']);
      }
      if (mode == AuthenticationMode.adminRegister) {
        await db.collection('Admins').doc(result.user!.uid).set({
          'UserId': result.user!.uid,
          'Username': '${data['Username']}',
          'Email': '${data['Email']}',
        });
      } else if (mode == AuthenticationMode.register) {
        await db.collection('Users').doc(result.user!.uid).set({
          'UserId': result.user!.uid,
          'Username': '${data['Username']}',
          'Email': '${data['Email']}',
        });
      }

      return "Success";
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  Future<bool> isUserAdmin({required String userId}) async {
    DocumentSnapshot<Map<String, dynamic>> res;
    res = await db.collection("Admins").doc(userId).get();
    if (res.exists) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addRecord({
    required Map<String, dynamic> data,
    required String userId,
  }) async {
    // Get reference to Firebase Storage
    final ref = FirebaseStorage.instance
        .ref()
        .child('user-images')
        .child('$userId.jpg'); // Fix the file extension

    // Upload image to Firebase Storage
    await ref.putFile(data["Image"] as File);

    // Get download URL for the uploaded image
    final url = await ref.getDownloadURL();

    // Update data with the image URL
    data["Image"] = url.toString();

    // Store data in Firestore
    await FirebaseFirestore.instance.collection("Records").add(data);
  }

  Future<Map<String, dynamic>> getRecord({
    required Map<String, String> data,
  }) async {
    Map<String, String> dataMatch = {
      "Name": "",
      "Gender": "",
      "DateOfBirth": "",
      "State": "",
      "Aadhar": "",
      "Crime": "",
      "SearchStatus": "false",
      "Image": ""
    };

    await db.collection("Records").get().then((value) {
      for (var element in value.docs) {
        if (element.data()["Aadhar"] == data["Aadhar"] &&
            element.data()["Name"] == data["Name"]) {
          dataMatch["Name"] = element.data()["Name"];

          dataMatch["Gender"] = element.data()["Gender"];

          dataMatch["DateOfBirth"] = element.data()["DateOfBirth"];

          dataMatch["State"] = element.data()["State"];

          dataMatch["Aadhar"] = element.data()["Aadhar"];

          dataMatch["Crime"] = element.data()["Crime"];

          dataMatch["SearchStatus"] = "true";

          dataMatch["Image"] = element.data()["Image"];
          return dataMatch;
        }
      }
    });

    return dataMatch;
  }
}
