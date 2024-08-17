

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'model/userprofilemodel.dart';

class FireBaseService{


  Future<User?> signUpWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Failed to sign up: $e');
      return null;
    }
  }

  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }
  void signUpUser(ProfileModel profile) async {
    try {
      // Attempt to sign up the user
      User? user = await signUpWithEmailAndPassword(profile.mailId!, profile.password!);

      if (user != null) {
        // If sign-up is successful, save the user profile
        await saveUserProfile(profile);
        // Show success message or navigate to the next screen
        print("User signed up and profile saved successfully!");
        // You can use Navigator or any other method to navigate to the next screen here
      } else {
        // If user is null, show an error message
        print("Failed to sign up. Please try again.");
      }
    } catch (e) {
      // Catch any exceptions during the process and print an error message
      print("An error occurred: $e");
    }
  }

  Future<String> saveUserProfile(ProfileModel profile) async {
    try {
      await FirebaseFirestore.instance
          .collection('profiles')
          .doc(profile.mailId) // Using mailId as the document ID
          .set(profile.toJson());
      return "Success";
    } catch (e) {
      return ("Failed to save profile: $e");
    }
  }




}