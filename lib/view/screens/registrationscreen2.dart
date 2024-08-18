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
  late Registrationscreen2Bloc bloc;
  final _formKey = GlobalKey<FormState>(); // Create a GlobalKey

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
          title: const Text("REGISTRATION"),
        ),
        body: BlocBuilder<Registrationscreen2Bloc, Registrationscreen2State>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Form( // Wrap with Form widget
                  key: _formKey, // Assign the form key
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.app_registration, color: Colors.green),
                          SizedBox(width: SizeConfig.blockSizeHorizontal! * 5),
                          const CustomText(
                            text: "Welcome, give us a few details about you",
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 3),
                      const Text("MARITAL STATUS"),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        hint: const Text('Select an Option', style: TextStyle(color: Colors.black54)),
                        value: bloc.selectedMarStatus,
                        items: Utilities.MaritalOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: const TextStyle(color: Colors.black54)),
                          );
                        }).toList(),
                        validator: (value) => value == null ? 'Please select marital status' : null,
                        onChanged: (String? newValue) {
                          setState(() {
                            bloc.selectedMarStatus = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text("CASTE"),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        hint: const Text('Select an Option', style: TextStyle(color: Colors.black54)),
                        value: bloc.selectedCaste,
                        items: Utilities.CasteOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: const TextStyle(color: Colors.black54)),
                          );
                        }).toList(),
                        validator: (value) => value == null ? 'Please select a caste' : null,
                        onChanged: (String? newValue) {
                          setState(() {
                            bloc.selectedCaste = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text("SUB CASTE (optional)"),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: bloc.subCaste,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text("DHOSHAM"),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        hint: const Text('Select an Option', style: TextStyle(color: Colors.black54)),
                        value: bloc.selectedDhosham,
                        items: Utilities.DhoshamOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: const TextStyle(color: Colors.black54)),
                          );
                        }).toList(),
                        validator: (value) => value == null ? 'Please select a dhosham option' : null,
                        onChanged: (String? newValue) {
                          setState(() {
                            bloc.selectedDhosham = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const CustomText(
                            text: "Willing to marry from other \ncommunities?",
                          ),
                          const Spacer(),
                          ToggleSwitch(
                            activeFgColor: Colors.white,
                            activeBgColor: [Colors.orange],
                            initialLabelIndex: 0,
                            totalSwitches: 2,
                            labels: const ['Yes', 'No'],
                            onToggle: (index) {
                              bloc.selectedMarrydiffComm = index == 0 ? "Yes" : "No";
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomText(
                        text: "Groom's Current Location",
                        size: SizeConfig.blockSizeVertical! * 2,
                        weight: FontWeight.bold,
                      ),
                      const SizedBox(height: 20),
                      const CustomText(
                        text: "COUNTRY LIVING IN",
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: bloc.countryValue,
                        validator: (value) => value!.isEmpty ? 'Please enter country' : null,
                      ),
                      const SizedBox(height: 10),
                      const CustomText(
                        text: "STATE LIVING IN",
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: bloc.stateValue,
                        validator: (value) => value!.isEmpty ? 'Please enter state' : null,
                      ),
                      const SizedBox(height: 10),
                      const CustomText(
                        text: "CITY LIVING IN",
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: bloc.cityValue,
                        validator: (value) => value!.isEmpty ? 'Please enter city' : null,
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                      Center(
                        child: Container(
                          width: SizeConfig.blockSizeVertical! * 25,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Utilities.profileUser.maritalStatus = bloc.selectedMarStatus;
                                Utilities.profileUser.caste = bloc.selectedCaste;
                                Utilities.profileUser.subCaste = bloc.subCaste.text.trim();
                                Utilities.profileUser.dhosham = bloc.selectedDhosham;
                                Utilities.profileUser.marryOtherCommunity = bloc.selectedMarrydiffComm;
                                Utilities.profileUser.countryLiving = bloc.countryValue.text.trim();
                                Utilities.profileUser.state = bloc.stateValue.text.trim();
                                Utilities.profileUser.city = bloc.cityValue.text.trim();
                                Utilities.profileUser.UiId = Utilities.UserUiId;

                                Navigator.pushNamed(context, AppRoutes.registerationscreen3);
                              }
                            },
                            child: const Center(
                              child: CustomText(
                                text: "Continue",
                                color: Colors.white,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical! * 2),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
