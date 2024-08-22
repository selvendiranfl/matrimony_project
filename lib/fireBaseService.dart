

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


  // void signUpUser(ProfileModel profile) async {
  //   try {
  //     // Attempt to sign up the user
  //     User? user = await signUpWithEmailAndPassword(profile.mailId!, profile.password!);
  //
  //     if (user != null) {
  //       // If sign-up is successful, save the user profile
  //       await saveUserProfile(profile);
  //       // Show success message or navigate to the next screen
  //       print("User signed up and profile saved successfully!");
  //       // You can use Navigator or any other method to navigate to the next screen here
  //     } else {
  //       // If user is null, show an error message
  //       print("Failed to sign up. Please try again.");
  //     }
  //   } catch (e) {
  //     // Catch any exceptions during the process and print an error message
  //     print("An error occurred: $e");
  //   }
  // }

  Future<String> saveMaleUserProfile(ProfileModel profile) async {
    try {
      await FirebaseFirestore.instance
          .collection('Maleprofiles')
          .doc(profile.mailId) // Using mailId as the document ID
          .set(profile.toJson());
      return "Success";
    } catch (e) {
      return ("Failed to save profile: $e");
    }
  }
  Future<String> saveFeMaleUserProfile(ProfileModel profile) async {
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
  Future<List<ProfileModel>> getMaleProfiles() async {
    List<ProfileModel> profiles = [];

    try {
      // Access the FeMaleprofiles collection from Firestore
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('profiles').get();

      // Iterate over the documents in the collection
      for (var doc in snapshot.docs) {
        // Convert each document to a ProfileModel object
        ProfileModel profile = ProfileModel.fromJson(doc.data() as Map<String, dynamic>);
        profiles.add(profile);
      }
    } catch (e) {
      print('Error getting profiles: $e');
    }

    return profiles;
  }

  Future<List<ProfileModel>> getFeMaleProfiles() async {
    List<ProfileModel> profiles = [];

    try {
      // Access the FeMaleprofiles collection from Firestore
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('FeMaleprofiles').get();

      // Iterate over the documents in the collection
      for (var doc in snapshot.docs) {
        // Convert each document to a ProfileModel object
        ProfileModel profile = ProfileModel.fromJson(doc.data() as Map<String, dynamic>);
        profiles.add(profile);
      }
    } catch (e) {
      print('Error getting profiles: $e');
    }

    return profiles;
  }

  Future<ProfileModel?> getProfileByUiId(String uiid) async {
    List<String> collections = ['Maleprofiles', 'FeMaleprofiles','profiles']; // Add more collections if needed

    try {
      for (String collection in collections) {
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection(collection)
            .where('UiId', isEqualTo: uiid)
            .get();

        if (snapshot.docs.isNotEmpty) {
          // If the profile is found, return the ProfileModel object
          print("----Not--emptyyy----");
          return ProfileModel.fromJson(snapshot.docs.first.data() as Map<String, dynamic>);
        }
      }
    } catch (e) {
      print('Error fetching profile: $e');
    }

    // If no profile is found in any collection, return null
    return null;
  }
  Future<void> saveHabitToFirebase(String uiid, String habit, String selectedHabit) async {
    List<String> collections = ['Maleprofiles', 'FeMaleprofiles', 'profiles'];
    try {
      for (String collection in collections) {
        // Query the documents where 'UiId' is equal to the given uiid
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(collection)
            .where('UiId', isEqualTo: uiid)
            .get();

        // Iterate through the documents and update each one
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          await doc.reference.update({
            habit.toLowerCase(): selectedHabit,
          });
        }
      }
      print('Habit saved successfully');
    } catch (e) {
      print('Error saving habit: $e');
    }
  }
  Future<String> saveViewerData(String uiid, String viewer) async {
    List<String> collections = ['Maleprofiles', 'FeMaleprofiles', 'profiles'];
    try {
      for (String collection in collections) {
        // Query the documents where 'UiId' is equal to the given uiid
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(collection)
            .where('UiId', isEqualTo: uiid)
            .get();
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          await FirebaseFirestore.instance
              .collection(collection)
              .doc(document.id)
              .update({
            'viewers': FieldValue.arrayUnion([viewer])
          });
        }
        // Iterate through the documents and update each one
        }
      print('views saved successfully');
      return "Success";
    } catch (e) {
      print('Error saving habit: $e');
      return e.toString();
    }
  }
  Future<String> savefavData(String uiid, String favId) async {
    List<String> collections = ['Maleprofiles', 'FeMaleprofiles', 'profiles'];
    try {
      for (String collection in collections) {
        // Query the documents where 'UiId' is equal to the given uiid
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(collection)
            .where('UiId', isEqualTo: uiid)
            .get();
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          await FirebaseFirestore.instance
              .collection(collection)
              .doc(document.id)
              .update({
            'favourites': FieldValue.arrayUnion([favId])
          });
        }
        // Iterate through the documents and update each one
      }
      print('Favourites saved successfully');
      return "Success";
    } catch (e) {
      print('Error saving habit: $e');
      return e.toString();
    }
  }

  Future<String> removefavData(String uiid, String favId) async {
    List<String> collections = ['Maleprofiles', 'FeMaleprofiles', 'profiles'];
    try {
      for (String collection in collections) {
        // Query the documents where 'UiId' is equal to the given uiid
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(collection)
            .where('UiId', isEqualTo: uiid)
            .get();
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          await FirebaseFirestore.instance
              .collection(collection)
              .doc(document.id)
              .update({
            'favourites': FieldValue.arrayRemove([favId])
          });
        }
        // Iterate through the documents and update each one
      }
      print('Favourites removed successfully');
      return "Success";
    } catch (e) {
      print('Error saving habit: $e');
      return e.toString();
    }
  }
  Future<String> SendInterestedReq(String SenderId, String RecieverId) async {
    List<String> collections = ['Maleprofiles', 'FeMaleprofiles', 'profiles'];
    try {
      for (String collection in collections) {
        // Query the documents where 'UiId' is equal to the given uiid
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(collection)
            .where('UiId', isEqualTo: RecieverId)
            .get();
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          await FirebaseFirestore.instance
              .collection(collection)
              .doc(document.id)
              .update({
            'requests': FieldValue.arrayUnion([SenderId])
          });
        }
        // Iterate through the documents and update each one
      }
      for (String collection in collections) {
        // Query the documents where 'UiId' is equal to the given uiid
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(collection)
            .where('UiId', isEqualTo: SenderId)
            .get();
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          await FirebaseFirestore.instance
              .collection(collection)
              .doc(document.id)
              .update({
            'requestsent': FieldValue.arrayUnion([RecieverId])
          });
        }
        // Iterate through the documents and update each one
      }
      print('Requested successfully');
      return "Success";
    } catch (e) {
      print('Error saving habit: $e');
      return e.toString();
    }
  }
  Future<String> UnSendInterestedReq(String SenderId, String RecieverId) async {
    List<String> collections = ['Maleprofiles', 'FeMaleprofiles', 'profiles'];
    try {
      for (String collection in collections) {
        // Query the documents where 'UiId' is equal to the given uiid
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(collection)
            .where('UiId', isEqualTo: RecieverId)
            .get();
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          await FirebaseFirestore.instance
              .collection(collection)
              .doc(document.id)
              .update({
            'requests': FieldValue.arrayRemove([SenderId])
          });
        }
        // Iterate through the documents and update each one
      }
      for (String collection in collections) {
        // Query the documents where 'UiId' is equal to the given uiid
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(collection)
            .where('UiId', isEqualTo: SenderId)
            .get();
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          await FirebaseFirestore.instance
              .collection(collection)
              .doc(document.id)
              .update({
            'requestsent': FieldValue.arrayRemove([RecieverId])
          });
        }
        // Iterate through the documents and update each one
      }
      print('Requested successfully');
      return "Success";
    } catch (e) {
      print('Error saving habit: $e');
      return e.toString();
    }
  }



}