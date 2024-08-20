import 'package:flutter/material.dart';
import 'package:matrimony_app/helper/Colors.dart';
import 'package:matrimony_app/helper/Utilities.dart';
import 'package:matrimony_app/widget/customtext.dart';

import '../../helper/size_config.dart';

class PricingScreen extends StatefulWidget {
  @override
  _PricingScreenState createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: pro_primaryColor,
                      borderRadius: BorderRadius.circular(8)
                    ),

                      child: Image.asset("assets/premium_3777218.png",height: SizeConfig.blockSizeVertical! * 2.5,color: Colors.white,)
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal! * 1,),
                  CustomText(
                    text: "Gold",
                    color: pro_primaryColor,
                    weight: FontWeight.bold,
                    size: SizeConfig.screenWidth! * large_text_mid,
                  )
                ],
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
              CustomText(
                text: "Services & Benefits",
                weight: FontWeight.bold,
                size: SizeConfig.screenWidth! * large_text,
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
              Container(
                child:Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check,color: pro_primaryColor,size:SizeConfig.blockSizeVertical! * 3 ),
                        SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                        CustomText(
                          text:"Complete profile makeover and bio writting by \nMatrimony Expert",
                          weight: FontWeight.bold,
                        )
                      ],
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check,color: pro_primaryColor,size:SizeConfig.blockSizeVertical! * 3 ),
                        SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                        CustomText(
                          text:"1:1 monthly consultation for insights and\n recommendation by dedicated matrimony\n advisor",
                          weight: FontWeight.bold,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! * 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BenefitsWidget("View Contact Nos.", "40-Mobile Numbers", Icons.phone_iphone_sharp),
                  BenefitsWidget("View Horoscope.", "Unlimited", Icons.air_rounded),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BenefitsWidget("Send messages", "Unlimited", Icons.mark_unread_chat_alt_outlined),
                  BenefitsWidget("Gov ID Verified", "Matches", Icons.add_card_sharp),
                ],
              ),
              BenefitsWidget("Chats & VideoCall", "Unlimited", Icons.video_camera_front_outlined),
              SizedBox(height: SizeConfig.blockSizeVertical! *1,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildPricingOption("GOLD", "3 months", "₹5,300", "₹4,900", true),
                    SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
                    Stack(
                      children: [
                        Container(
                          height: SizeConfig.blockSizeVertical! * 25,
                          width: SizeConfig.blockSizeHorizontal! * 40,
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(text: "PREMIUM", weight: FontWeight.bold, size: SizeConfig.screenWidth! * medium_text),
                              CustomText(text: "3 months", color: Colors.grey),
                              Text(
                                "₹7,500",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                              ),
                              Text('₹6,900', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: pro_primaryColor),
                                  ),
                                  padding: EdgeInsets.all(5),
                                  child: Visibility(
                                    visible: true,
                                    child: CircleAvatar(
                                      radius: SizeConfig.blockSizeHorizontal! * 1.5,
                                      backgroundColor: pro_primaryColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star,size: SizeConfig.blockSizeVertical! *2,color: Colors.amber,),
                                Text(
                                  'Best Selling',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.star,size: SizeConfig.blockSizeVertical! *2,color: Colors.amber,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! *2,),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 120,vertical: 5),
                  decoration: BoxDecoration(
                    color: pro_primaryColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: CustomText(
                    text: "Pay Now",
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! *1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "View All Packages",
                    color: pro_primaryColor,
                  ),
                  Icon(Icons.arrow_forward_ios,color: pro_primaryColor,size: SizeConfig.blockSizeVertical! *2,)
                ],
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! *2,),
              Center(
                child: CustomText(
                  text: "Have any queries or need help in\n making payment?",
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical! *2,),
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
                          Icon(Icons.mark_chat_read_outlined,color: Colors.green,),
                          SizedBox(width: SizeConfig.blockSizeHorizontal! * 1,),
                          CustomText(text:'Chat with us',color: Colors.black,weight: FontWeight.bold,),
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
                          Icon(Icons.phone,color: Colors.green,),
                          CustomText(text:'Call Us',color: Colors.black,weight: FontWeight.bold,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }

Widget BenefitsWidget(topic,subtopic,IconData,){
    return Row(
      children: [
        Icon(IconData,size: SizeConfig.blockSizeVertical! * 3,),
        SizedBox(width: SizeConfig.blockSizeHorizontal! * 1,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: topic,
              weight: FontWeight.bold,
            ),
            CustomText(
              text: subtopic,
              size: SizeConfig.screenWidth! * small_text,
            )
          ],
        )
      ],
    );
}

  Widget _buildPricingOption(String title, String duration, String originalPrice, String discountedPrice, bool isSelected) {
    return Container(
      height: SizeConfig.blockSizeVertical! *23,
      width: SizeConfig.blockSizeHorizontal! * 40,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? Colors.orangeAccent : Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? Colors.orangeAccent.shade100.withOpacity(0.3) : Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(text: title, weight: FontWeight.bold,size: SizeConfig.screenWidth! * medium_text,),
          CustomText(text:duration,color: Colors.grey,),
          Text(
            originalPrice,
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
            ),
          ),
          Text(discountedPrice, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: pro_primaryColor)
              ),
              padding: EdgeInsets.all(5),
              child: Visibility(
                visible: isSelected,
                child: CircleAvatar(
                  radius: SizeConfig.blockSizeHorizontal! *1.5,
                  backgroundColor: pro_primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


}
