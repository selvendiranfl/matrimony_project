import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matrimony_app/widget/customtext.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:image_picker/image_picker.dart';

import '../../helper/Colors.dart';
import '../../helper/Utilities.dart';
import '../../helper/size_config.dart';
import '../bloc/homescreen/homescreenbloc_bloc.dart';
import 'matchesScreen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    MatchesScreen(),
    //MailBoxPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'MailBox',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();
  late HomescreenblocBloc bloc ;

  @override
  void initState() {
    bloc = BlocProvider.of<HomescreenblocBloc>(context);
    super.initState();
  }


  // Function to pick image from gallery
  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Handle the selected image (e.g., display it, upload it, etc.)
      print('Selected image path: ${image.path}');
    }
  }

  // Function to pick image from camera
  Future<void> _pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Handle the captured image (e.g., display it, upload it, etc.)
      print('Captured image path: ${image.path}');
    }
  }

  void _showPickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  print("ghh");
                  _pickImageFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  _pickImageFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<HomescreenblocBloc, HomescreenblocState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: BlocBuilder<HomescreenblocBloc, HomescreenblocState>(
            builder: (context, state) {
              SizeConfig().init(context);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.blockSizeVertical! * 3,),
                    Center(
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0), // Set your desired border radius here
                        ),
                        child: ToggleSwitch(
                          minWidth: SizeConfig.blockSizeHorizontal! * 25,
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
                    SizedBox(height: SizeConfig.blockSizeVertical! * 2,),
                    Card(
                     child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 14,vertical: 8),
                       child: Row(
                         children: [
                           Stack(
                             children: [
                               // CircleAvatar with profile image
                               CircleAvatar(
                                 radius: 35.0, // Adjust the radius as needed
                                 child: Icon(Icons.person), // Replace with your image URL
                               ),
                               // Positioned camera icon in the bottom-right corner
                               Positioned(
                                 bottom: 0,
                                 left: 0,
                                 child: Container(
                                   height: 30.0,
                                   width: 30.0,
                                   decoration: BoxDecoration(
                                     color: Colors.white, // Background color for the camera icon
                                     shape: BoxShape.circle,
                                   ),
                                   child: InkWell(
                                     onTap: (){
                                       _showPickerOptions();
                                     },
                                     child: Icon(
                                       Icons.camera_alt,
                                       color: Colors.black, // Icon color
                                       size: 20.0, // Adjust icon size
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                           SizedBox(width: SizeConfig.blockSizeVertical! * 2,),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               CustomText(
                                 text: Utilities.profileUser.name,
                                 size: SizeConfig.screenWidth! * medium_text,
                                 weight: FontWeight.bold,
                               ),
                               Row(
                                 children: [
                                   CustomText(
                                     text: "Free Member",
                                     size: SizeConfig.screenWidth! * small_text,
                                   ),
                                   SizedBox(width: SizeConfig.blockSizeVertical! * 1,),
                                   Container(
                                     padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4), // Adjust padding as needed
                                     decoration: BoxDecoration(
                                       border: Border.all(color: pro_primaryColor),
                                       borderRadius: BorderRadius.circular(20.0), // Set your desired border radius
                                     ),
                                     child: CustomText(
                                       text: "Upgrade",
                                       size: SizeConfig.screenWidth! * tiny_text_extra,
                                       color: pro_primaryColor,
                                     ),
                                   )
                                 ],
                               ),
                             ],
                           ),
                           Spacer(),
                           SvgPicture.asset(
                               "assets/bell-svgrepo-com.svg",
                             height: SizeConfig.blockSizeVertical! * 2.8,
                             color: Colors.grey,
                           ),
                           SizedBox(width: SizeConfig.blockSizeVertical! * 2,),
                           Icon(Icons.menu)
                         ],
                       ),
                     ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
