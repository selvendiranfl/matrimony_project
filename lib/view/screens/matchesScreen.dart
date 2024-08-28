import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrimony_app/helper/Colors.dart';
import 'package:matrimony_app/model/userprofilemodel.dart';
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
  late MatchesscreenBloc bloc ;
  @override
  void initState() {
    bloc = BlocProvider.of<MatchesscreenBloc>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: BlocListener<MatchesscreenBloc, MatchesscreenState>(
            listener: (context, state) {
              if(state is ViewerAddStateSuccessState){
                Navigator.pushNamed(context, AppRoutes.ProfileDetailScreen,
                  arguments: {
                    'profile': Utilities.AllProfilesList[bloc.SelectedProfileIndex],
                    'index': bloc.SelectedProfileIndex,
                  },);
              }
              if(state is ShortListAdded){
                bloc.add(FetchSortDataEvent());
              }
              if(state is BlockedUserSuccessState){
                bloc.add(RemoveBlockedUsersEvent());
              }
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
                            if(index==1){
                              Navigator.pushNamed(context, AppRoutes.PremiumScreen);
                            }
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
                        Tab(child: CustomText(text: "All matches"),),
                        Tab(
                          child: DropdownButtonFormField<String>(
                            value: Utilities.SortingOptions.first,
                            items: Utilities.SortingOptions.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Center(
                                  child: CustomText(
                                    text: value,
                                  ),
                                ),
                              );
                            }).toList(),

                            onChanged: (String? newValue) {
                              bloc.SortBy = newValue.toString();
                              bloc.add(FetchSortDataEvent());
                            },
                          ),
                        ),
                      ],
                    ),

                    Expanded(
                      child: TabBarView(
                        children: [

                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
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
                              Utilities.AllProfilesList.length ==0 ?
                              Center(
                                child: CustomText(
                                  text: "No Profiles Found",
                                  weight: FontWeight.bold,
                                  size: SizeConfig.screenWidth! * large_text_mid ,

                                ),
                              ) : Flexible(
                                child: ListView.builder(
                                    itemCount: Utilities.AllProfilesList.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return AllProfileWidget(Utilities.AllProfilesList[index],index);
                                
                                    }),
                              ),
                            ],
                          ),
                          bloc.SortingUserList.length==0 ?
                              Center(
                                child: CustomText(
                                  text: "No Profiles Found",
                                  weight: FontWeight.bold,
                                  size: SizeConfig.screenWidth! * large_text_mid ,

                                ),
                              ) :
                          ListView.builder(
                              itemCount: bloc.SortingUserList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context, AppRoutes.ProfileDetailScreen,
                                        arguments: {
                                          'profile': bloc.SortingUserList[index],
                                          'index': index,
                                        },);
                                    },
                                    child: ShortListProfileWidget(bloc.SortingUserList[index],index)
                                );

                              }),

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
  
  Widget AllProfileWidget(ProfileModel Profiles,int index){
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
                        child: InkWell(
                          onTap: (){
                            bloc.SelectedProfileId = Profiles.UiId!;
                            bloc.SelectedProfileIndex = index;
                            bloc.add(ViewerAddEvent());
                          },
                          child: Image.network(
                            'https://cdn2.vectorstock.com/i/1000x1000/54/41/young-and-elegant-woman-avatar-profile-vector-9685441.jpg',
                            // Replace with profile picture URL
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Shortlist label
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              bloc.SelectedfavId = Profiles.UiId!;
                              bloc.add(FavDataEvent());
                            },
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
                                  Icon(Icons.star_outline_rounded,color: Utilities.profileUser.favourites!.contains(Profiles.UiId) ? Colors.yellow :  Colors.grey,),
                                  CustomText(
                                    text: Utilities.profileUser.favourites!.contains(Profiles.UiId) ? 'Shortlisted': "Shortlist",
                                    color: Colors.black,
                                    size: SizeConfig.screenWidth! * medium_text,

                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.blockSizeHorizontal! *1,),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              if(value == "Report"){
                                print("report");
                                _showReportDialog(context,Profiles.UiId);
                              }else if(value == "Block"){
                                _showBlockDialog(context,Profiles.UiId);
                                print("Block");
                              }
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem<String>(
                                  value: 'Report',
                                  child: Text('Report'),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Block',
                                  child: Text('Block'),
                                ),
                              ];
                            },
                            child: Icon(Icons.more_vert),
                          )

                        ],
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
                text: Profiles.name,
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
                    text: Profiles.height,
                  ),

                  CustomText(
                    text: Profiles.caste,
                  ),

                  CustomText(
                    text: Profiles.education,
                  ),

                  CustomText(
                    text: Profiles.occupation,
                  ),

                  CustomText(
                    text: Profiles.city,
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
                  InkWell(
                    onTap: (){
                      bloc.SelectedRecieverId = Profiles.UiId!;
                      bloc.add(ReqSendEvent());
                    },
                    child: Container(
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
                            text: Utilities.profileUser.requestsent!.contains(Profiles.UiId) ? "Request Sent" : "Send Interested",
                            size: SizeConfig.screenWidth! * medium_text,
                            color: Colors.white,
                          ),
                        ],
                      ),
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

  Widget ShortListProfileWidget(ProfileModel Profiles,int index){
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
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              bloc.SelectedfavId = Profiles.UiId!;
                              bloc.add(FavDataEvent());
                            },
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
                                  Icon(Icons.star_outline_rounded,color: Utilities.profileUser.favourites!.contains(Profiles.UiId) ? Colors.yellow :  Colors.grey,),
                                  CustomText(
                                    text: Utilities.profileUser.favourites!.contains(Profiles.UiId) ? 'Shortlisted': "Shortlist",
                                    color: Colors.black,
                                    size: SizeConfig.screenWidth! * medium_text,

                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.blockSizeHorizontal! *1,),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              if(value == "Report"){
                                print("report");
                                _showReportDialog(context,Profiles.UiId);
                              }else if(value == "Block"){
                                print(Profiles.UiId);
                                _showBlockDialog(context,Profiles.UiId);
                                print("Block");
                              }
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem<String>(
                                  value: 'Report',
                                  child: Text('Report'),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Block',
                                  child: Text('Block'),
                                ),
                              ];
                            },
                            child: Icon(Icons.more_vert),
                          )

                        ],
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
                text: Profiles.name,
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
                    text: Profiles.height,
                  ),

                  CustomText(
                    text: Profiles.caste,
                  ),

                  CustomText(
                    text: Profiles.education,
                  ),

                  CustomText(
                    text: Profiles.occupation,
                  ),

                  CustomText(
                    text: Profiles.city,
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
                  InkWell(
                    onTap: (){
                      bloc.SelectedRecieverId = Profiles.UiId!;
                      bloc.add(ReqSendEvent());
                    },
                    child: Container(
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
                            text: Utilities.profileUser.requestsent!.contains(Profiles.UiId) ? "Request Sent" : "Send Interested",
                            size: SizeConfig.screenWidth! * medium_text,
                            color: Colors.white,
                          ),
                        ],
                      ),
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


  void _showReportDialog(BuildContext context,UserId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Report'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Please provide a reason for reporting:'),
              TextField(
                controller: bloc.reportController,
                decoration: InputDecoration(
                  hintText: 'Enter your reason here',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (bloc.reportController.text.trim().isNotEmpty) {
                  bloc.ReportUserID = UserId;
                  bloc.add(ReportUserEvent());
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a reason')),
                  );
                }
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );

      },
    );
  }

  void _showBlockDialog(BuildContext context,UserId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Block User'),
          content: Text('Are you sure you want to block this user?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                bloc.BlockingUserID = UserId;
                bloc.add(BlockUserEvent());
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
