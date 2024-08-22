import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrimony_app/helper/size_config.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../helper/Utilities.dart';
import '../../router.dart';
import '../../widget/customtext.dart';
import '../../widget/customtextfield.dart';
import '../../widget/customtextfieldNum.dart';
import '../bloc/regirationscreen2/registrationscreen2_bloc.dart';
import '../bloc/registrationscreen3/registrationscreen3_bloc.dart';



class Registrationscreen3 extends StatefulWidget {
  const Registrationscreen3({super.key});

  @override
  State<Registrationscreen3> createState() => _Registrationscreen3State();
}

class _Registrationscreen3State extends State<Registrationscreen3> {

  late Registrationscreen3Bloc bloc ;

  @override
  void initState() {
    bloc = BlocProvider.of<Registrationscreen3Bloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            icon: Icon(Icons.arrow_back_ios_new_sharp),
          ),
          title: Text("REGISTRATION"),
        ),
        body: BlocListener<Registrationscreen3Bloc, Registrationscreen3State>(
          listener: (context, state) {
            if(state is RegistrationsuccessState){
              Navigator.pushReplacementNamed(context, AppRoutes.HomeScreen);
            }
            if(state is RegistrationFailedState){
              Utilities.showToast("Registration failed");
            }
        },
        child: BlocBuilder<Registrationscreen3Bloc, Registrationscreen3State>(
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
                        Icon(Icons.keyboard_double_arrow_right,color: Colors.green,),
                        SizedBox(width: SizeConfig.blockSizeHorizontal! *3,),
                        CustomText(
                          text: "Just a few more details and you are good to go!",
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *3,),
                    CustomText(
                      text: "HEIGHT",
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *2),
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

                        items: Utilities.HeightList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: TextStyle(color: Colors.black54),),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            bloc.Height = newValue!;
                          });
                        },
                      ),
                    ),
                SizedBox(height: SizeConfig.blockSizeVertical! *3,),
                CustomText(
                  text: "PHYSICAL STATUS",
                ),
                SizedBox(height: SizeConfig.blockSizeVertical! *2),
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

                    items: Utilities.PhysicalStatus.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style: TextStyle(color: Colors.black54),),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      bloc.PhysicalStatus = newValue!;
                    },
                  ),
                ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *3,),
                    CustomText(
                      text: "EDUCATION",
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *2),
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

                        items: Utilities.EducationList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: TextStyle(color: Colors.black54),),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            bloc.education = newValue!;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *3,),
                    CustomText(
                      text: "OCCUPATION",
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *2),
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

                        items: Utilities.occupationList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: TextStyle(color: Colors.black54),),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            bloc.occupation = newValue!;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *2),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "CURRENCY",
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical! *1),
                            InkWell(
                              onTap: () {
                                showCurrencyPicker(
                                  context: context,
                                  showFlag: true,
                                  showCurrencyName: true,
                                  showCurrencyCode: true,
                                  onSelect: (Currency currency) {
                                    setState(() {
                                      bloc.currencyType = currency.code.toString();
                                    });
                                  },
                                );
                              },
                              child: Container(
                                 // Set your desired width here
                                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0), // Adjust padding as needed
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey, // Set border color
                                    width: 1.0, // Set border width
                                  ),
                                  borderRadius: BorderRadius.circular(8.0), // Set border radius if needed
                                ),
                                child: CustomText(
                                  text: bloc.currencyType,
                                ),
                              ),
                            )

                          ],
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal! *3,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "ANNUAL INCOME",
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical! *1),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical! *8,
                              width: SizeConfig.blockSizeHorizontal! *60, // Set your desired width here
                              child: CustomTextField(
                                controller: bloc.annualIncome,
                                // your properties here
                              ),
                            )

                          ],
                        )

                      ],
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *3,),
                    CustomText(
                      text: "FAMILY TYPE",
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ChoiceChip(
                          label: Text("JOINT"),
                          selected: bloc.selectedFamilyType == "JOINT",
                          onSelected: (bool selected) {
                            setState(() {
                              bloc.selectedFamilyType = (selected ? "JOINT" : "")!;
                            });
                          },
                          backgroundColor: Colors.white, // Color when the chip is not selected
                        ),
                        SizedBox(width: 10), // Add some space between the chips
                        ChoiceChip(
                          label: Text("NUCLEAR"),
                          selected: bloc.selectedFamilyType == "NUCLEAR",
                          onSelected: (bool selected) {
                            setState(() {
                              bloc.selectedFamilyType = (selected ? "NUCLEAR" : "")!;
                            });
                          },
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *2,),
                    CustomText(
                      text: "FAMILY VALUES",
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *2),
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

                        items: Utilities.FamilyValues.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: TextStyle(color: Colors.black54),),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            bloc.familyValue = newValue!;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *3,),
                    CustomText(
                      text: "ANCESTRAL ORIGIN",
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *2),
                    TextFormField(
                      controller: bloc.AncestralValues,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey
                              ),
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill this';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *3,),
                    CustomText(
                      text: "ABOUT MYSELF",
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *2),
                    SizedBox(
                      height: 60,
                      child: TextFormField(
                        controller: bloc.aboutMyself,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey
                                ),
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        maxLines: null, // Allows the text field to grow with content
                        expands: true,  // Expands to fill the parent container's height
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! *2),
                    Center(
                      child: Container(

                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: InkWell(
                            onTap: (){
                              Utilities.profileUser.height = bloc.Height;
                              Utilities.profileUser.physicalStatus = bloc.PhysicalStatus;
                              Utilities.profileUser.education = bloc.education;
                              Utilities.profileUser.occupation = bloc.occupation;
                              Utilities.profileUser.annualIncome = bloc.annualIncome.text.trim();
                              Utilities.profileUser.currencyType = bloc.currencyType;
                              Utilities.profileUser.familyType = bloc.selectedFamilyType;
                              Utilities.profileUser.familyValue = bloc.familyValue;
                              Utilities.profileUser.ancestralValues = bloc.AncestralValues.text.trim();
                              Utilities.profileUser.aboutMyself = bloc.aboutMyself.text.trim();

                              bloc.add(RegistrationEvent());

                            },
                            child: Center(
                                child: Text("Complete Registration",style: TextStyle(color: Colors.white,fontSize: 15),))),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
),
      ),
    );
  }
}

