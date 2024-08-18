import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matrimony_app/widget/customtext.dart';

import '../../helper/Colors.dart';
import '../../helper/Utilities.dart';
import '../../helper/size_config.dart';
import '../bloc/profileDetailScreenBloc/profile_detail_screen_bloc.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({super.key});

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDetailScreenBloc, ProfileDetailScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: CustomText(
              text: "ALL MATCHES 1/7",
              weight: FontWeight.bold,
            ),
          ),
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: SizeConfig.screenHeight!/2,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.zero, // Remove default padding
                    title: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent, // Ensure transparency
                      ),
                      width: double.infinity, // Ensure it takes full width
                      height: 300.0, // Set height to your preference
                      child: Stack(
                        fit: StackFit.expand, // Ensure it fills the Container
                        children: <Widget>[
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                'https://cdn2.vectorstock.com/i/1000x1000/54/41/young-and-elegant-woman-avatar-profile-vector-9685441.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                          Icons.star_outline_rounded,
                                          color: Colors.grey,
                                        size: SizeConfig.blockSizeVertical! * 2,
                                      ),
                                      CustomText(
                                        text: 'Shortlist',
                                        color: Colors.black,
                                        size: SizeConfig.screenWidth! * tiny_text_extra,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.more_vert),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(color: pro_primaryColor),
                              ),
                              child: Text(
                                'Request her to add photo',
                                style: TextStyle(color: pro_primaryColor,
                                    fontSize: SizeConfig.screenWidth! * tiny_text_mid),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Later",
                          weight: FontWeight.bold,
                          size: SizeConfig.screenHeight! * small_text,
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
                          children: [
                            SmallIcon(Icons.person_outline_sharp),
                            SizedBox(width: SizeConfig.blockSizeHorizontal! *2,),
                            CustomText(
                              text: "28 Yrs, 4'6",
                            )
                          ],
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        Row(
                          children: [
                            SmallIcon(Icons.app_registration),
                            SizedBox(width: SizeConfig.blockSizeHorizontal! *2,),
                            CustomText(
                              text: "Dhanak",
                            )
                          ],
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        Row(
                          children: [
                            SmallIcon(Icons.shopping_bag_outlined),
                            SizedBox(width: SizeConfig.blockSizeHorizontal! *2,),
                            CustomText(
                              text: "ME, Not Working",
                            )
                          ],
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        Row(
                          children: [
                            SmallIcon(Icons.location_on_outlined),
                            SizedBox(width: SizeConfig.blockSizeHorizontal! *2,),
                            CustomText(
                              text: "Kanpir, Uttar Pradesh",
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 8,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "About Nisha Katheria",
                          weight: FontWeight.bold,
                          size: SizeConfig.screenWidth! * large_text_mid,
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        CustomText(
                          text: "I am nisha katheria from kanpur mujhe ek achha \n Iadka chaiye jo sbki care kre mere liye loyal ho",
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 8,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [

                            CustomText(
                              text: "Profile verification score - 1/5",
                              weight: FontWeight.bold,
                              size: SizeConfig.screenWidth! * large_text_mid,
                            ),
                            SizedBox(width: SizeConfig.blockSizeHorizontal! * 1,),
                            Icon(Icons.info_outline,color: Colors.grey,)
                          ],
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                VerificationIcon(Icons.phone_android_outlined,layoverred),
                                CustomText(text:"Mobile \nverified",size: SizeConfig.screenWidth! * tiny_text)
                              ],
                            ),
                            SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                            Column(
                              children: [
                                VerificationIcon(Icons.credit_card,Colors.grey),
                                CustomText(text:"Gov Id \nverified",size: SizeConfig.screenWidth! * tiny_text,color: Colors.grey)
                              ],
                            ),
                            SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                            Column(
                              children: [
                                VerificationIcon(Icons.person_pin_outlined,Colors.grey),
                                CustomText(text:"Photo not \nverified",size: SizeConfig.screenWidth! * tiny_text,color: Colors.grey,)
                              ],
                            ),
                            SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                            Column(
                              children: [
                                VerificationIcon(Icons.cast_for_education_outlined,Colors.grey),
                                CustomText(text:"Photo not \nverified",size: SizeConfig.screenWidth! * tiny_text,color: Colors.grey,)
                              ],
                            ),
                            SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                            Column(
                              children: [
                                VerificationIcon(Icons.wallet,Colors.grey),
                                CustomText(text:"Photo not \nverified",size: SizeConfig.screenWidth! * tiny_text,color: Colors.grey,)
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(thickness: 8,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Her basic Details",
                          weight: FontWeight.bold,
                          size: SizeConfig.screenWidth! * large_text_mid,
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        Column(
                          children: [
                            BasicDetail(Icons.person_outline_sharp,"Age","28 years"),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            BasicDetail(Icons.personal_injury_outlined,"Physique","4'6 | Normal"),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            BasicDetail(Icons.wechat_sharp,"Spoken languages","Hindi"),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            BasicDetail(Icons.dinner_dining_sharp,"Eating Habits","Vegitarian"),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            BasicDetail(Icons.edit_note_sharp,"Profile created by","Self"),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            BasicDetail(Icons.sync_lock_rounded,"Marital Status","Never Married"),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            BasicDetail(Icons.location_on_outlined,"Live In","Kanpur, Uttar Pradesh"),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            BasicDetail(Icons.flag_outlined,"Citizen","Indian Citizen"),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            HabitCheckWidget("Smoking",Icons.smoking_rooms),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            HabitCheckWidget("Drinking",Icons.wine_bar_outlined),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MembershipBenefits(),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Her Religious Details",
                          weight: FontWeight.bold,
                          size: SizeConfig.screenWidth! * large_text_mid,
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        Column(
                          children: [
                            BasicDetail(Icons.temple_hindu_outlined,"Religion","Hindu"),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            BasicDetail(Icons.personal_injury_outlined,"Caste/ SubCaste","Dhanak"),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            ReigiousCheckWidget("Gothra",Icons.ten_mp_outlined,),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            ReigiousCheckWidget("Dhosham",Icons.ten_mp_outlined,),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            ReigiousCheckWidget("Star/Raasi",Icons.star_outline_rounded,),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            ReigiousCheckWidget("Kundli Score",Icons.spa_outlined,),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DateOfBirth(),
                  ),
                  Divider(thickness: 8,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "About Her Family",
                          weight: FontWeight.bold,
                          size: SizeConfig.screenWidth! * large_text_mid,
                        ),
                        CustomText(
                          text: "Request family details",
                          size: SizeConfig.screenWidth! * medium_text,
                          color: pro_primaryColor,
                        ),
                    SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: Colors.indigoAccent,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Icon(Icons.home_outlined,color: Colors.white,),
                        ),
                        SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Ancestral Origin",
                              size: SizeConfig.screenWidth! * medium_text,
                              color: Colors.grey,
                            ),
                            CustomText(
                              text: "*****",
                              weight: FontWeight.bold,
                              size: SizeConfig.screenWidth! * large_text_mid,
                            ),
                            CustomText(
                              text: "Add your Ancestral Origin",
                              color: pro_primaryColor,
                              size: SizeConfig.screenWidth! * medium_text,
                            )
                          ],
                        )
                      ],
                    )
                      ],
                    ),
                  ),
                  Divider(thickness: 8,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Nisha's Partner Preferences",
                          weight: FontWeight.bold,
                          size: SizeConfig.screenWidth! * large_text_mid,
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                        Card(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.shade300,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage("https://thumbs.dreamstime.com/b/businessman-profile-icon-vector-business-man-avatar-user-image-businessman-profile-icon-vector-business-man-avatar-user-image-icon-209894049.jpg"),
                                  radius: SizeConfig.blockSizeVertical! * 4,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "You match ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: SizeConfig.screenWidth! * medium_text
                                        ),
                                      ),
                                      TextSpan(
                                        text: "20/21",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green, // Green color for "20/21"
                                            fontSize: SizeConfig.screenWidth! * medium_text
                                        ),
                                      ),
                                      TextSpan(
                                        text: " \nof her preference",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black, // Default color for the rest of the text
                                            fontSize: SizeConfig.screenWidth! * medium_text
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundImage: NetworkImage("https://cdn3.vectorstock.com/i/thumb-large/25/87/young-executive-woman-profile-icon-vector-9692587.jpg"),
                                  radius: SizeConfig.blockSizeVertical! * 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Her Basic Preferences",
                              weight: FontWeight.bold,
                              size: SizeConfig.screenWidth! * large_text_mid,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: "Your match",
                                  weight: FontWeight.bold,
                                  size: SizeConfig.screenWidth! * medium_text,
                                ),
                                SizedBox(width: SizeConfig.blockSizeHorizontal! *1,),
                                Icon(Icons.check_circle_outline,color: Colors.green,)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                        BasicPreferenceWidget("Preferred Groom's Age", "20-35 yrs", Icons.check_circle_outline),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        BasicPreferenceWidget("Preferred Height", "4'6-5'6 yrs", Icons.check_circle_outline),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        BasicPreferenceWidget("Preferred Height", "4'6-5'6 yrs", Icons.check_circle_outline),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        BasicPreferenceWidget("Preferred Height", "4'6-5'6 yrs", Icons.check_circle_outline),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        BasicPreferenceWidget("Preferred Marital Status", "Never Married", Icons.check_circle_outline),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        BasicPreferenceWidget("Preferred Mother Tongue", "Hindi", Icons.close),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        BasicPreferenceWidget("Preferred Physical Status", "Normal", Icons.check_circle_outline),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        BasicPreferenceWidget("Preferred Eating Habits", "Doesn't matter", Icons.check_circle_outline),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        BasicPreferenceWidget("Preferred Smoking Habits", "Doesn't matter", Icons.check_circle_outline),
                        SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                        BasicPreferenceWidget("Preferred Drinking Habits", "Doesn't matter", Icons.check_circle_outline),
                      ],
                    ),
                  ),
              Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Her Religious Preferences",
                weight: FontWeight.bold,
                size: SizeConfig.screenWidth! * large_text_mid,
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
              BasicPreferenceWidget("Preferred Religion", "Hindu", Icons.check_circle_outline),
              SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
              BasicPreferenceWidget("Preferred Caste", "something", Icons.close),
              SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
              BasicPreferenceWidget("Preferred Subcaste", "something", Icons.check_circle_outline),
              SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
              BasicPreferenceWidget("Preferred Star", "Any", Icons.check_circle_outline),
              SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
              BasicPreferenceWidget("Preferred Dhosham", "Doesn't Matter", Icons.check_circle_outline),
                ]
          )
              ),
                  SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Her Proffessional Preferences",
                              weight: FontWeight.bold,
                              size: SizeConfig.screenWidth! * large_text_mid,
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                            BasicPreferenceWidget("Preferred Education", "MBBS", Icons.check_circle_outline),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            BasicPreferenceWidget("Preferred Employment Type", "Any", Icons.close),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            BasicPreferenceWidget("Preferred Occupation", "Any", Icons.check_circle_outline),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            BasicPreferenceWidget("Preferred Annual Income", "Any", Icons.check_circle_outline),
                          ]
                      )
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Her Location Preferences",
                              weight: FontWeight.bold,
                              size: SizeConfig.screenWidth! * large_text_mid,
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                            BasicPreferenceWidget("Preferred Country", "Any", Icons.check_circle_outline),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            BasicPreferenceWidget("Preferred Residing State", "Any", Icons.close),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            BasicPreferenceWidget("Preferred Residing City", "Any", Icons.check_circle_outline),
                            SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                            BasicPreferenceWidget("Preferred Citizenship", "Any", Icons.check_circle_outline),
                          ]
                      )
                  ),
                ],
              ),
            ), // Add your main content here
          ),
        );
      },
    );
  }
  Widget BasicPreferenceWidget(topic,content,IconData){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: topic,
            ),
            CustomText(
              text: content,
              weight: FontWeight.bold,
            )
          ],
        ),
        Icon(IconData,color: Colors.green,size: SizeConfig.blockSizeVertical! *3.5,)
      ],
    );
  }
  Widget SmallIcon(IconData){
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Icon(IconData,color: Colors.white,size: SizeConfig.blockSizeVertical! *2,),
    );
  }
  Widget VerificationIcon(IconData,Color){
    return  Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Color,
        ),
        child: Icon(IconData,color: Colors.white,size: SizeConfig.blockSizeVertical! * 4,)
    );
  }
  Widget BasicDetailsWidget(IconData){
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Icon(IconData,color: Colors.white,),
    );
  }
  Widget BasicDetail(IconData,TopicText,Detail){
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Icon(IconData,color: Colors.white,),
        ),
        SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: TopicText,
              size: SizeConfig.screenWidth! * medium_text,
              color: Colors.grey,
            ),
            CustomText(
              text: Detail,
              weight: FontWeight.bold,
            )
          ],
        )
      ],
    );

  }

  Widget HabitCheckWidget(habit,IconData){
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Icon(IconData,color: Colors.white,),
        ),
        SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "${habit} Habits",
              size: SizeConfig.screenWidth! * medium_text,
              color: Colors.grey,
            ),
            InkWell(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: CustomText(text:'${habit} Habit',weight: FontWeight.bold,),
                      content: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Choose',
                          border: OutlineInputBorder(),
                        ),
                        value: Utilities.SomkingHabitList[0],
                        items: Utilities.SomkingHabitList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {

                        },
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Add'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: CustomText(
                text: "To view her ${habit} habits, add yours",
                color: pro_primaryColor,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget ReigiousCheckWidget(habit,IconData){
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Icon(IconData,color: Colors.white,),
        ),
        SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: habit,
              size: SizeConfig.screenWidth! * medium_text,
              color: Colors.grey,
            ),
            InkWell(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: CustomText(text:habit,weight: FontWeight.bold,),
                      content: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Choose',
                          border: OutlineInputBorder(),
                        ),
                        value: Utilities.SomkingHabitList[0],
                        items: Utilities.SomkingHabitList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {

                        },
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Add'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: CustomText(
                text: "request ${habit}",
                color: pro_primaryColor,
              ),
            )
          ],
        ),
      ],
    );
  }
}


class MembershipBenefits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(0, 4),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: SizeConfig.blockSizeHorizontal! * 60,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.orange,
               // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.0),bottomRight: Radius.circular(60)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.workspace_premium,color: Colors.white,),
                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                  Text(
                    'Paid membership benefits',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.screenWidth! * small_text
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! *2,),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Icon(Icons.phone,color: Colors.white,size: SizeConfig.blockSizeVertical! * 2.5,),
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 2),
              CustomText(
                text:'Mobile Number',
               weight: FontWeight.bold,
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 4),
             CustomText(
               text: "|",
             ),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 4),
              Icon(Icons.verified, color: Colors.green),
              SizedBox(width: 4.0),
              CustomText(
                text:'Verified',
                color: Colors.grey,
                weight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          CustomText(
            text:'+91 91********',
            weight: FontWeight.bold,
            size: SizeConfig.screenWidth! * large_text,
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/icons8-whatsapp-48.png",height: SizeConfig.blockSizeVertical! * 3,),
                      CustomText(text:'WhatsApp',color: Colors.black,weight: FontWeight.bold,),
                    ],
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal! *3,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.phone,color: pro_primaryColor,),
                      CustomText(text:'Call Now',color: Colors.black,weight: FontWeight.bold,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, color: Colors.grey),
              SizedBox(width: 8.0),
              Text(
                'To call or WhatsApp her directly',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 1),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle Become a paid member action
              },
              child: CustomText(text: 'Become a paid member',color: Colors.white,),
              style: ElevatedButton.styleFrom(
                backgroundColor: pro_primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 1),
        ],
      ),
    );
  }
}

class DateOfBirth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: Offset(0, 4),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: SizeConfig.blockSizeHorizontal! * 60,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.orange,
                // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.0),bottomRight: Radius.circular(60)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.workspace_premium,color: Colors.white,),
                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                  Text(
                    'Paid membership benefits',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.screenWidth! * small_text
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! *2,),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Icon(Icons.calendar_today,color: Colors.white,size: SizeConfig.blockSizeVertical! * 2,),
              ),
              SizedBox(width: SizeConfig.blockSizeHorizontal! * 2),
              CustomText(
                text:'Date Of Birth',
                weight: FontWeight.bold,
              ),
              ]
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
          CustomText(
            text:'********',
            weight: FontWeight.bold,
            size: SizeConfig.screenWidth! * large_text,
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, color: Colors.grey),
              SizedBox(width: 8.0),
              Text(
                'Upgrade to view details',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 1),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle Become a paid member action
              },
              child: CustomText(text: 'Become a paid member',color: Colors.white,),
              style: ElevatedButton.styleFrom(
                backgroundColor: pro_primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical! * 1),
        ],
      ),
    );
  }
}

