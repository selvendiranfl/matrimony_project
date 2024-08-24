import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrimony_app/widget/customtext.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../helper/Utilities.dart';
import '../../helper/size_config.dart';
import '../bloc/mailboxscreen/mailbox_bloc.dart';

class MailBoxScreen extends StatefulWidget {
  const MailBoxScreen({super.key});

  @override
  State<MailBoxScreen> createState() => _MailBoxScreenState();
}

class _MailBoxScreenState extends State<MailBoxScreen> {
  late MailboxBloc bloc ;

  @override
  void initState() {
    bloc = BlocProvider.of<MailboxBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<MailboxBloc, MailboxState>(
          listener: (context, state) {
            if(state is RequestAcceptState){
              bloc.add(FetchRequestDataEvent());
            }
            if(state is DeclineRequestAcceptState){
              bloc.add(FetchRequestDataEvent());
            }
          },
          child: BlocBuilder<MailboxBloc, MailboxState>(
            builder: (context, state) {
              SizeConfig().init(context);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
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
                   SizedBox(height: SizeConfig.blockSizeVertical! *2,),
                    bloc.RequestProfileList.length ==0 ?
                    Center(
                      child: CustomText(
                        text: "No Profiles Found",
                        weight: FontWeight.bold,
                        size: SizeConfig.screenWidth! * large_text_mid ,

                      ),
                    ):
                    Expanded(
                      child: ListView.builder(
                          itemCount: bloc.RequestProfileList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return RequestWidget(index);
                      
                          }),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  RequestWidget(int index){
    return  Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.brown),
          borderRadius: BorderRadius.circular(8)
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://cdn2.vectorstock.com/i/1000x1000/54/41/young-and-elegant-woman-avatar-profile-vector-9685441.jpg',
            ),
            radius: SizeConfig.blockSizeVertical! * 3,
          ),
          SizedBox(width: SizeConfig.blockSizeHorizontal! * 4,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: bloc.RequestProfileList[index].name,
              ),
              CustomText(
                text: "${bloc.RequestProfileList[index].education}",
              ),
            ],
          ),
          Spacer(),
          InkWell(
            onTap: (){
              bloc.AcceptProfileIndex = index;
              bloc.add(DeclineRequestEvent());
            },
            child: CircleAvatar(
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.close),
              radius: SizeConfig.blockSizeVertical! * 3,
            ),
          ),
          SizedBox(width: SizeConfig.blockSizeHorizontal! * 2,),
          InkWell(
            onTap: (){
              bloc.AcceptProfileIndex = index;
              bloc.add(AcceptRequestEvent());
            },
            child: CircleAvatar(
              backgroundColor: Colors.greenAccent,
              child: Icon(Icons.check),
              radius: SizeConfig.blockSizeVertical! * 3,
            ),
          ),
        ],
      ),
    );
  }
}
