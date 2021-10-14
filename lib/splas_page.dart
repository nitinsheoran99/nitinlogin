import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nitinlogin/Signup_page.dart';
import 'package:nitinlogin/dbhelper_page.dart';
import 'package:nitinlogin/login_page.dart';
import 'package:nitinlogin/userinfo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: formkey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextFormField(
                controller: namecontroller,
                decoration: InputDecoration(
                    hintText: 'Input valid Name',icon: Icon(Icons.person)

                ),
                validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'Please input name';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                    hintText: 'Input  password',icon: Icon(Icons.password)
                ),
                validator: (value) {
                  if(value==null || value.isEmpty){
                    return 'Please input name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    if(formkey.currentState!.validate()){
                      String name = namecontroller.text;
                      String password = passwordcontroller.text;
                      UserInfo? userInfo =DbHelper.userInfo;
                      if(userInfo == null){print('create account');}
                      else{
                        if(name ==userInfo.name && password ==userInfo.password){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                        }
                        else{print('your id is incorrect');}
                      }
                    }
                  }, child: Text('Login')),
                  SizedBox(width: 30,),
                  ElevatedButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder:
                        (context)=>Signup(),));
                  }, child: Text('Signup'))
                ],)
            ],
          ),

        ),
      ),
    );
  }
}
