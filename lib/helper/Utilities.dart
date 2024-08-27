



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/userprofilemodel.dart';
import 'Colors.dart';
import 'navigatorService.dart';

const double small_text= 0.035;
const double medium_text= 0.04;
const double large_text= 0.045;
const double large_text_mid= 0.050;
const double large_text_extra= 0.055;
const double tiny_text= 0.030;
const double tiny_text_extra= 0.025;
const double tiny_text_mid= 0.028;

class Utilities{

  static ProfileModel profileUser = ProfileModel();
  static List<ProfileModel> AllProfilesList = [];

  static List<String> CreatedForOptions = ["select","Myself", "Son", "Daughter", "Brother"];
  static List<String> ReligionOptions = ["select","Hindu", "Muslim - Sha", "Muslim - Sunni", "Muslim - others","Christian","Sikh","Jain - Digambar",];
  static List<String> LanguageOptions = ["select","Tamil", "Bengali", "Gujarati", "Hindi","Kannada","Malayalam","Marathi",];
  static List<String> MaritalOptions = ["select","Never married", "Widower", "Divorced", "Awaiting divorce"];
  static List<String> CasteOptions = ["select","Never married", "Widower", "Divorced", "Awaiting divorce"];
  static List<String> DhoshamOptions = ["select","Never married", "Widower", "Divorced", "Awaiting divorce"];
  static List<String> PhysicalStatus = ["Normal","Physically challenged"];
  static List<String> FamilyValues = ["Orthodox","Traditional", "Moderate","Liberal"];
  static List<String> HeightList = ["5.1","5.2"];
  static List<String> EducationList = ["B.sc","BCA"];
  static List<String> occupationList = ["B.sc","BCA"];
  static List<String> SomkingHabitList = ["Select","Occasionally","Regularly","Never"];
  static List<String> SortingOptions = ["Viewed you","Shortlisted by you", "Horoscope Match"];

  static String UserUiId = "";
  static String FcmToken = "";
  static String ProfileCollectionName = "";
  static String SelfCollectionName = "";


  static showProgress() {
    showDialog(
      barrierDismissible: false,
      context: NavigationService.navigatorKey.currentContext!,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            insetPadding: const EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.transparent,
            titlePadding: EdgeInsets.zero,
            elevation: 0,
            scrollable: true,
            title: Center(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 16.0),
                    Text(
                      'Loading...',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static showToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: pro_secondaryColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static dismissProgress() {
    if (Navigator.canPop(NavigationService.navigatorKey.currentContext!)) {
      Navigator.pop(NavigationService.navigatorKey.currentContext!);
    }
  }
}