import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../helper/Utilities.dart';
import '../../widget/customtext.dart';
import '../bloc/SignUpBloc/sign_up_bloc.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpBloc bloc ;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: bloc.selectedDate,
        firstDate: DateTime(1950, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != bloc.selectedDate) {
      setState(() {
        bloc.selectedDate = picked;
      });
    }
  }
  @override
  void initState() {
    bloc = BlocProvider.of<SignUpBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  child: BlocBuilder<SignUpBloc, SignUpState>(
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/tamil-matrimony-logo.png",height: 70,),
            Text("Already a member? Login",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.orange),)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("FIND THE PERFECT MATCH - REGISTER FREE!",style: TextStyle(fontSize: 16),)),
              SizedBox(height: 30,),
              Text("PROFILE CREATED FOR"),
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
                  value: bloc.selectedValue,
                  items: Utilities.CreatedForOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(color: Colors.black54),),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      bloc.selectedValue = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 10,),
              Text("NAME"),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Mobile No./ E-Mail ID",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey
                        ),
                        borderRadius: BorderRadius.circular(10)
                    )
                ),),
              SizedBox(height: 10,),
              Text("GENDER"),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ChoiceChip(
                    label: Text("Male"),
                    selected: bloc.selectedGender == "Male",
                    onSelected: (bool selected) {
                      setState(() {
                        bloc.selectedGender = (selected ? "Male" : "")!;
                      });
                    },
                    backgroundColor: Colors.grey[300], // Color when the chip is not selected
                  ),
                  SizedBox(width: 10), // Add some space between the chips
                  ChoiceChip(
                    label: Text("Female"),
                    selected: bloc.selectedGender == "Female",
                    onSelected: (bool selected) {
                      setState(() {
                        bloc.selectedGender = (selected ? "Female" : "")!;
                      });
                    },
                    backgroundColor: Colors.grey[300],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("DATE OF BIRTH"),
              SizedBox(height: 10),
              InkWell(
                onTap: (){
                  _selectDate(context);
                },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)
                    ),
                      child: Text(DateFormat('yyyy-MM-dd').format(bloc.selectedDate))
                  )
              ),
              SizedBox(height: 10),
              Text("RELIGION"),
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
                  value: bloc.selectedReligion,
                  items: Utilities.ReligionOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(color: Colors.black54),),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      bloc.selectedReligion = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 10,),
              Text("MOTHER TONGUE"),
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
                  value: bloc.selectedLanguage,
                  items: Utilities.LanguageOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(color: Colors.black54),),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      bloc.selectedLanguage = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 10,),
              Text("COUNTRY CODE"),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: CountryCodePicker(
                    onChanged: (value){
                      
                    },
                    initialSelection: 'In',
                    
                  ),
                    hintText: "NUMBER",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey
                        ),
                        borderRadius: BorderRadius.circular(10)
                    )
                ),),
              SizedBox(height: 10,),
              Text("EMAIL"),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "E-Mail ID",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey
                        ),
                        borderRadius: BorderRadius.circular(10)
                    )
                ),),
              SizedBox(height: 10,),
              Text("PASSWORD"),
              SizedBox(height: 10,),
              TextFormField(
                obscureText: !bloc.showPassword,
                decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: InkWell(
                        onTap: (){
                          bloc.add(PasswordHideSUEvent());
                        },
                        child: bloc.showPassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off)
                    ),
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
              ),
              SizedBox(height: 10,),
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
              CustomText(
                text: "Groom's Current Location",
              ),
              Center(
                child: Container(
                  width: 150,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: InkWell(
                      onTap: (){

                      },
                      child: Center(
                          child: Text("REGISTER FREE",style:TextStyle(color: Colors.white,fontSize: 15),))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  },
),
);
  }
}

