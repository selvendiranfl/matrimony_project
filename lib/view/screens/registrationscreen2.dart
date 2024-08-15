import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrimony_app/helper/size_config.dart';
import 'package:matrimony_app/widget/customtextfield.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../helper/Utilities.dart';
import '../../router.dart';
import '../../widget/customtext.dart';
import '../bloc/regirationscreen2/registrationscreen2_bloc.dart';



class Registrationscreen2 extends StatefulWidget {
  const Registrationscreen2({super.key});

  @override
  State<Registrationscreen2> createState() => _Registrationscreen2State();
}

class _Registrationscreen2State extends State<Registrationscreen2> {

  late Registrationscreen2Bloc bloc ;

  @override
  void initState() {
    bloc = BlocProvider.of<Registrationscreen2Bloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("REGISTRATION"),
        ),
        body: BlocBuilder<Registrationscreen2Bloc, Registrationscreen2State>(
        builder: (context, state) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.app_registration,color: Colors.green,),
                    SizedBox(width: SizeConfig.blockSizeHorizontal! *5,),
                    CustomText(
                      text: "Welcome, give us a few details about you",
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.blockSizeVertical! *3,),
                Text("MARITAL STATUS"),
                SizedBox(height: 10,),
                SizedBox(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2), // Border color and width
                        borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2), // Border when focused
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    hint: Text('Select an Option',style: TextStyle(color: Colors.black54)),
                    value: bloc.selectedMarStatus,
                    items: Utilities.MaritalOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style: TextStyle(color: Colors.black54),),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        bloc.selectedMarStatus = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Text("CASTE"),
                SizedBox(height: 10,),
                SizedBox(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2), // Border color and width
                        borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2), // Border when focused
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    hint: Text('Select an Option',style: TextStyle(color: Colors.black54)),
                    value: bloc.selectedCaste,
                    items: Utilities.CasteOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style: TextStyle(color: Colors.black54),),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        bloc.selectedCaste = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Text("SUB CASTE(optional)"),
                SizedBox(height: 10,),
                TextFormField(
                  controller: bloc.subCaste,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey
                          ),
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),),
                SizedBox(height: 10,),
                Text("DHOSHAM"),
                SizedBox(height: 10,),
                SizedBox(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2), // Border color and width
                        borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2), // Border when focused
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    hint: Text('Select an Option',style: TextStyle(color: Colors.black54)),
                    value: bloc.selectedDhosham,
                    items: Utilities.DhoshamOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style: TextStyle(color: Colors.black54),),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        bloc.selectedDhosham = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    CustomText(
                      text: "Willng to marry from other \ncommunities?",
                    ),
                    Spacer(),
                    ToggleSwitch(
                      activeFgColor: Colors.white,
                      activeBgColor: [Colors.orange],
                      initialLabelIndex: 0,
                      totalSwitches: 2,
                      labels: [
                        'Yes',
                        'No',
                      ],
                      onToggle: (index) {
                        bloc.selectedMarrydiffComm = index==0? "Yes":"No";
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                CustomText(
                  text: "Groom's Current Location",
                  size: SizeConfig.blockSizeVertical! * 2,
                  weight: FontWeight.bold,
                ),
                SizedBox(height: 20,),
                CustomText(
                  text: "COUNTRY LIVING IN",
                ),
                SizedBox(height: 10,),
                CustomTextField(
                  controller: bloc.countryValue,
                ),
                SizedBox(height: 10,),
                CustomText(
                  text: "STATE LIVING IN",
                ),
                SizedBox(height: 10,),
                CustomTextField(
                  controller: bloc.stateValue,
                ),
                SizedBox(height: 10,),
                CustomText(
                  text: "CITY LIVING IN",
                ),
                SizedBox(height: 10,),
                CustomTextField(
                  controller: bloc.cityValue,
                ),
                SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                Center(
                  child: Container(
                    width:  SizeConfig.blockSizeVertical! * 25,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: InkWell(
                        onTap: (){
                          Utilities.profileUser.maritalStatus = bloc.selectedMarStatus;
                          Utilities.profileUser.caste = bloc.selectedCaste;
                          Utilities.profileUser.subCaste = bloc.subCaste.text.trim();
                          Utilities.profileUser.dhosham = bloc.selectedDhosham;
                          Utilities.profileUser.marryOtherCommunity = bloc.selectedMarrydiffComm;
                          Utilities.profileUser.countryLiving = bloc.countryValue.text.trim();
                          Utilities.profileUser.state = bloc.stateValue.text.trim();
                          Utilities.profileUser.city = bloc.cityValue.text.trim();

                          Navigator.pushReplacementNamed(context, AppRoutes.registerationscreen3);
                        },
                        child: Center(
                            child:CustomText(
                              text: "Continue",
                              color: Colors.white,
                              weight: FontWeight.bold,
                            )
                        ))
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
              ],
            ),
        ),
      );
        },
      ),
      ),
    );
  }
}
