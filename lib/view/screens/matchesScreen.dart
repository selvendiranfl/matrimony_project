import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrimony_app/helper/Colors.dart';
import 'package:matrimony_app/router.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../helper/Utilities.dart';
import '../../helper/size_config.dart';
import '../../widget/customtext.dart';
import '../bloc/matchesscreen/matchesscreen_bloc.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: BlocListener<MatchesscreenBloc, MatchesscreenState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            child: BlocBuilder<MatchesscreenBloc, MatchesscreenState>(
              builder: (context, state) {
                SizeConfig().init(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Set your desired border radius here
                        ),
                        child: ToggleSwitch(
                          minWidth: SizeConfig.blockSizeHorizontal! * 35,
                          cornerRadius: 20.0,
                          activeBgColor: [Colors.orange.shade100],
                          activeFgColor: Colors.deepOrange,
                          inactiveBgColor: Colors.white,
                          inactiveFgColor: Colors.black,
                          fontSize: SizeConfig.screenWidth! * medium_text,
                          initialLabelIndex: 0,
                          totalSwitches: 2,
                          labels: ['Regular', 'PRIME'],
                          radiusStyle: true,
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 2,
                    ),
                    TabBar(
                      labelColor: Colors.green, // Selected tab text color
                      unselectedLabelColor: Colors.black, // Unselected tab text color
                      indicatorColor: Colors.green, // Indicator color
                      tabs: [
                        Tab(text: "All Matches",),
                        Tab(text: "Mutual Matches",),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                text: "${Utilities.AllProfilesList.length} Matches based on your ",
                                weight: FontWeight.bold,
                              ),
                              CustomText(
                                text: "partner preferences",
                                weight: FontWeight.bold,
                                color: pro_primaryColor,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Checkbox(value: false, onChanged: (bool){}),
                                  CustomText(
                                    text: "show profiles I have not viewed",
                                    size: SizeConfig.screenWidth! * small_text,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.tune,size: SizeConfig.blockSizeVertical! * 1.9,),
                                    SizedBox(
                                      width: SizeConfig.blockSizeHorizontal! * 1,
                                    ),
                                    CustomText(
                                      text: "Filter",
                                      size: SizeConfig.screenWidth! * small_text,
                                    ),
                                  ],
                                ),
                              ),
                             Spacer(),
                              Icon(Icons.more_vert)

                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: Utilities.AllProfilesList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                      onTap: (){
                                        Navigator.pushNamed(
                                            context,
                                            AppRoutes.ProfileDetailScreen,
                                          arguments: {
                                            'profile': Utilities.AllProfilesList[index],
                                            'index': index,
                                          },
                                        );
                                      },
                                      child: ProfileWidget(index)
                                  );

                                }),
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: 8,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context, AppRoutes.ProfileDetailScreen,
                                        arguments: {
                                          'profile': Utilities.AllProfilesList[index],
                                          'index': index,
                                        },);
                                    },
                                      child: ProfileWidget(index)
                                  );

                                }),
                          )

                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
  
  Widget ProfileWidget(int index){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                width: double.infinity, // Adjust as needed
                height: SizeConfig.blockSizeVertical! * 45,
                child: Stack(
                  children: <Widget>[
                    // Profile picture
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        // Rounded corners
                        child: Image.network(
                          'https://cdn2.vectorstock.com/i/1000x1000/54/41/young-and-elegant-woman-avatar-profile-vector-9685441.jpg',
                          // Replace with profile picture URL
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Shortlist label
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Row(
                          children: [
                            Icon(Icons.star_outline_rounded,color: Colors.grey,),
                            CustomText(
                              text: 'Shortlist',
                              color: Colors.black,
                              size: SizeConfig.screenWidth! * medium_text,

                            ),
                          ],
                        ),
                      ),
                    ),
                    // Center text
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          border: Border.all(color: pro_primaryColor)
                        ),
                        child: Text(
                          'Request her to add photo',
                          style: TextStyle(
                              color: pro_primaryColor, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
              CustomText(
                text: Utilities.AllProfilesList[index].name,
                size: SizeConfig.screenWidth! * large_text_mid,
                weight: FontWeight.w600,
              ),
              Row(
                children: [
                  CustomText(
                    text: "H12238328",
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 1,),
                  CustomText(
                    text: "|",
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 1,),
                  CustomText(
                    text: "last seen few weeks ago",
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "21 yrs",
                  ),
                  CustomText(
                    text: Utilities.AllProfilesList[index].height,
                  ),

                  CustomText(
                    text: Utilities.AllProfilesList[index].caste,
                  ),

                  CustomText(
                    text: Utilities.AllProfilesList[index].education,
                  ),

                  CustomText(
                    text: Utilities.AllProfilesList[index].occupation,
                  ),

                  CustomText(
                    text: Utilities.AllProfilesList[index].city,
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.close,color: Colors.grey,),
                        CustomText(
                          text: "Don't Show",
                          size: SizeConfig.screenWidth! * medium_text,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                        color: pro_primaryColor
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.check,color: Colors.white,),
                        CustomText(
                          text: "Send Interested",
                          size: SizeConfig.screenWidth! * medium_text,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
