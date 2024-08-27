

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:matrimony_app/helper/Utilities.dart';

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
          .collection('FeMaleprofiles')
          .doc(profile.mailId) // Using mailId as the document ID
          .set(profile.toJson());
      return "Success";
    } catch (e) {
      return ("Failed to save profile: $e");
    }
  }


  Future<List<ProfileModel>> getProfiles() async {
    List<ProfileModel> profiles = [];

    try {
      // Access the FeMaleprofiles collection from Firestore
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(Utilities.ProfileCollectionName).get();

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
    List<String> collections = ['Maleprofiles', 'FeMaleprofiles']; // Add more collections if needed

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


  Future<ProfileModel?> saveHabitToFirebase(String uiid, String habit, String selectedHabit) async {
    try {
        // Query the documents where 'UiId' is equal to the given uiid
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(Utilities.SelfCollectionName)
            .where('UiId', isEqualTo: uiid)
            .get();

        // Iterate through the documents and update each one
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          await doc.reference.update({
            habit.toLowerCase(): selectedHabit,
          });

          // After updating, fetch the updated profile and return it
          DocumentSnapshot updatedDoc = await doc.reference.get();
          return ProfileModel.fromJson(updatedDoc.data() as Map<String, dynamic>);
        }
      print('Habit saved successfully');
      return null; // Return null if no profile is found
    } catch (e) {
      print('Error saving habit: $e');
      return null;
    }
  }



  Future<String> saveViewerData(String uiid, String viewer) async {
    try {

        // Query the documents where 'UiId' is equal to the given uiid
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(Utilities.ProfileCollectionName)
            .where('UiId', isEqualTo: uiid)
            .get();
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          await FirebaseFirestore.instance
              .collection(Utilities.ProfileCollectionName)
              .doc(document.id)
              .update({
            'viewers': FieldValue.arrayUnion([viewer])
          });
        }
        // Iterate through the documents and update each one
      print('views saved successfully');
      return "Success";
    } catch (e) {
      print('Error saving habit: $e');
      return e.toString();
    }
  }


  Future<ProfileModel?> savefavData(String uiid, String favId) async {
    ProfileModel? profile;

    try {

        // Query the documents where 'UiId' is equal to the given uiid
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(Utilities.SelfCollectionName)
            .where('UiId', isEqualTo: uiid)
            .get();

        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          // Update the favourites array in the document
          await FirebaseFirestore.instance
              .collection(Utilities.SelfCollectionName)
              .doc(document.id)
              .update({
            'favourites': FieldValue.arrayUnion([favId])
          });

          // Re-fetch the document to get updated data
          DocumentSnapshot updatedDocument = await FirebaseFirestore.instance
              .collection(Utilities.SelfCollectionName)
              .doc(document.id)
              .get();

          // Convert the updated document to a ProfileModel
          profile = ProfileModel.fromJson(updatedDocument.data() as Map<String, dynamic>);
      }
      print('Favourites saved successfully');
      return profile;
    } catch (e) {
      print('Error saving favourites: $e');
      return null;
    }
  }


  Future<ProfileModel?> removefavData(String uiid, String favId) async {
    ProfileModel? profile;

    try {

        // Query the documents where 'UiId' is equal to the given uiid
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(Utilities.SelfCollectionName)
            .where('UiId', isEqualTo: uiid)
            .get();

        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          // Update the favourites array in the document
          await FirebaseFirestore.instance
              .collection(Utilities.SelfCollectionName)
              .doc(document.id)
              .update({
            'favourites': FieldValue.arrayRemove([favId])
          });

          // Re-fetch the document to get updated data
          DocumentSnapshot updatedDocument = await FirebaseFirestore.instance
              .collection(Utilities.SelfCollectionName)
              .doc(document.id)
              .get();

          // Convert the updated document to a ProfileModel
          profile = ProfileModel.fromJson(updatedDocument.data() as Map<String, dynamic>);
      }
      print('Favourites removed successfully');
      return profile;
    } catch (e) {
      print('Error removing favourites: $e');
      return null;
    }
  }

  Future<ProfileModel?> sendInterestedReq(String senderId, String receiverId) async {
    ProfileModel? profile;

    try {
      // Update requests for the receiver
      QuerySnapshot receiverSnapshot = await FirebaseFirestore.instance
          .collection(Utilities.ProfileCollectionName)
          .where('UiId', isEqualTo: receiverId)
          .get();

      for (QueryDocumentSnapshot document in receiverSnapshot.docs) {
        await FirebaseFirestore.instance
            .collection(Utilities.ProfileCollectionName)
            .doc(document.id)
            .update({
          'requests': FieldValue.arrayUnion([senderId])
        });
      }

      // Update requests sent for the sender
      QuerySnapshot senderSnapshot = await FirebaseFirestore.instance
          .collection(Utilities.SelfCollectionName)
          .where('UiId', isEqualTo: senderId)
          .get();

      for (QueryDocumentSnapshot document in senderSnapshot.docs) {
        await FirebaseFirestore.instance
            .collection(Utilities.SelfCollectionName)
            .doc(document.id)
            .update({
          'requestsent': FieldValue.arrayUnion([receiverId])
        });

        // Re-fetch the document to get updated data
        DocumentSnapshot updatedDocument = await FirebaseFirestore.instance
            .collection(Utilities.SelfCollectionName)
            .doc(document.id)
            .get();

        // Convert the updated document to a ProfileModel
        profile = ProfileModel.fromJson(updatedDocument.data() as Map<String, dynamic>);
      }

      print('Request sent successfully');
      return profile;
    } catch (e) {
      print('Error sending interest request: $e');
      return null;
    }
  }


  Future<ProfileModel?> unSendInterestedReq(String senderId, String receiverId) async {
    ProfileModel? profile;

    try {
      // Remove requests for the receiver
      QuerySnapshot receiverSnapshot = await FirebaseFirestore.instance
          .collection(Utilities.ProfileCollectionName)
          .where('UiId', isEqualTo: receiverId)
          .get();

      for (QueryDocumentSnapshot document in receiverSnapshot.docs) {
        await FirebaseFirestore.instance
            .collection(Utilities.ProfileCollectionName)
            .doc(document.id)
            .update({
          'requests': FieldValue.arrayRemove([senderId])
        });
      }

      // Remove requests sent for the sender
      QuerySnapshot senderSnapshot = await FirebaseFirestore.instance
          .collection(Utilities.SelfCollectionName)
          .where('UiId', isEqualTo: senderId)
          .get();

      for (QueryDocumentSnapshot document in senderSnapshot.docs) {
        await FirebaseFirestore.instance
            .collection(Utilities.SelfCollectionName)
            .doc(document.id)
            .update({
          'requestsent': FieldValue.arrayRemove([receiverId])
        });

        // Re-fetch the document to get updated data
        DocumentSnapshot updatedDocument = await FirebaseFirestore.instance
            .collection(Utilities.SelfCollectionName)
            .doc(document.id)
            .get();

        // Convert the updated document to a ProfileModel
        profile = ProfileModel.fromJson(updatedDocument.data() as Map<String, dynamic>);
      }

      print('Request unsent successfully');
      return profile;
    } catch (e) {
      print('Error unsending interest request: $e');
      return null;
    }
  }




  Future<ProfileModel?> AcceptInterestedReq(String senderId, String receiverId) async {
    ProfileModel? profile;

    try {
      // Update AcceptedRequest array for the receiver
      QuerySnapshot receiverSnapshot = await FirebaseFirestore.instance
          .collection(Utilities.ProfileCollectionName)
          .where('UiId', isEqualTo: receiverId)
          .get();

      for (QueryDocumentSnapshot document in receiverSnapshot.docs) {
        await FirebaseFirestore.instance
            .collection(Utilities.ProfileCollectionName)
            .doc(document.id)
            .update({
          'AcceptedRequest': FieldValue.arrayUnion([senderId])
        });
      }

      // Update AcceptedRequest and requests arrays for the sender
      QuerySnapshot senderSnapshot = await FirebaseFirestore.instance
          .collection(Utilities.SelfCollectionName)
          .where('UiId', isEqualTo: senderId)
          .get();

      for (QueryDocumentSnapshot document in senderSnapshot.docs) {
        await FirebaseFirestore.instance
            .collection(Utilities.SelfCollectionName)
            .doc(document.id)
            .update({
          'AcceptedRequest': FieldValue.arrayUnion([receiverId]),
          'requests': FieldValue.arrayRemove([receiverId])
        });

        // Re-fetch the document to get updated data
        DocumentSnapshot updatedDocument = await FirebaseFirestore.instance
            .collection(Utilities.SelfCollectionName)
            .doc(document.id)
            .get();

        // Convert the updated document to a ProfileModel
        profile = ProfileModel.fromJson(updatedDocument.data() as Map<String, dynamic>);
      }

      print('Request accepted successfully');
      return profile;
    } catch (e) {
      print('Error accepting interest request: $e');
      return null;
    }
  }


  Future<ProfileModel?> DeclineInterestedReq(String senderId, String receiverId) async {
    ProfileModel? profile;

    try {
      // Remove the receiverId from requests array for the sender
      QuerySnapshot senderSnapshot = await FirebaseFirestore.instance
          .collection(Utilities.SelfCollectionName)
          .where('UiId', isEqualTo: senderId)
          .get();

      for (QueryDocumentSnapshot document in senderSnapshot.docs) {
        await FirebaseFirestore.instance
            .collection(Utilities.SelfCollectionName)
            .doc(document.id)
            .update({
          'requests': FieldValue.arrayRemove([receiverId])
        });

        // Re-fetch the document to get updated data
        DocumentSnapshot updatedDocument = await FirebaseFirestore.instance
            .collection(Utilities.SelfCollectionName)
            .doc(document.id)
            .get();

        // Convert the updated document to a ProfileModel
        profile = ProfileModel.fromJson(updatedDocument.data() as Map<String, dynamic>);
      }

      print('Request declined successfully');
      return profile;
    } catch (e) {
      print('Error declining interest request: $e');
      return null;
    }
  }


  Future<String> submitReport(String fromUserId, String toUserId, String reason) async {
    try {
      if (reason.isNotEmpty) {
        await FirebaseFirestore.instance.collection('reports').add({
          'from': fromUserId,
          'to': toUserId,
          'report': reason,
          'timestamp': FieldValue.serverTimestamp(),
        });

        // Return true to indicate success
        return "Success";
      } else {
        // Handle empty reason
        return "Failed";
      }
    } catch (e) {
      // Handle error
      print('Error submitting report: $e');
      return "Failed";
    }
  }

  Future<ProfileModel?> addBlockUser(String uiid, String blockId) async {
    ProfileModel? profile;

    try {
        // Query the documents where 'UiId' is equal to the given uiid
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(Utilities.SelfCollectionName)
            .where('UiId', isEqualTo: uiid)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          for (QueryDocumentSnapshot document in querySnapshot.docs) {
            // Update the block array in the document
            await FirebaseFirestore.instance
                .collection(Utilities.SelfCollectionName)
                .doc(document.id)
                .update({
              'block': FieldValue.arrayUnion([blockId])
            });

            // Re-fetch the document to get updated data
            DocumentSnapshot updatedDocument = await FirebaseFirestore.instance
                .collection(Utilities.SelfCollectionName)
                .doc(document.id)
                .get();

            // Convert the updated document to a ProfileModel and return it
            profile = ProfileModel.fromJson(updatedDocument.data() as Map<String, dynamic>);
          }
          print('Block User saved successfully');
          return profile;
        }

      print("Profile not found for the provided UiId.");
      return null;
    } catch (e) {
      print('Error saving block user: $e');
      return null;
    }
  }




}