import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../router.dart';
import '../bloc/loginBloc/log_in_bloc.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  late LogInBloc bloc ;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    bloc = BlocProvider.of<LogInBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInBloc, LogInState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  child: BlocBuilder<LogInBloc, LogInState>(
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/tamil-matrimony-logo.png",height: 70,),
            InkWell(
              onTap: (){
                Navigator.pushReplacementNamed(context, AppRoutes.registerationscreen1);
              },
                child: Text("REGISTER FREE",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.orange),))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Center(child: Text("LOGIN",style: TextStyle(fontSize: 25),)),
                SizedBox(height: 30,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Mobile No./ E-Mail ID",
                   hintStyle: TextStyle(color: Colors.grey),
                   border: OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Colors.grey
                     ),
                       borderRadius: BorderRadius.circular(10)
                   )
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Mobile No./ E-Mail ID';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30,),
                TextFormField(
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: InkWell(
                        onTap: (){
                          bloc.add(PasswordHideEvent());
                        },
                          child: showPassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off)
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
                SizedBox(height: 30,),
                Center(
                  child: Container(
                    width: 120,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: InkWell(
                      onTap: (){
                        if (_formKey.currentState?.validate() ?? false) {
                          bloc.add(LoginSummitEvent());
                        }
                      },
                        child: Center(
                            child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 15),))),
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Login Via OTP",style: TextStyle(color: Colors.orange,fontSize: 15),),
                    Text("|",style: TextStyle(color: Colors.grey)),
                    Text("Forgot Password?",style: TextStyle(color: Colors.orange,fontSize: 15))
                  ],
                ),
                SizedBox(height: 30,),
                Center(
                  child: Container(
                    width: 250,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey)
                    ),
                    child: InkWell(
                        onTap: (){
                    
                        },
                        child: Center(
                            child: Text("Not a member? Register FREE",style: TextStyle(color: Colors.grey,fontSize: 15),))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  },
),
);
  }
}
