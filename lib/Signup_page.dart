import 'package:flutter/material.dart';
import 'package:nitinlogin/dbhelper_page.dart';
import 'package:nitinlogin/login_page.dart';
import 'package:nitinlogin/splas_page.dart';
import 'package:nitinlogin/userinfo_page.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController mobilecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController confirmPasswordcontroller=TextEditingController();
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(key: formkey,
        child: Column(
          children: [
            TextFormField(
              controller: namecontroller,
              decoration: InputDecoration(
                  hintText: 'Input Name',icon: Icon(Icons.person)

              ),
              validator: (value) {
                if(value==null || value.isEmpty){
                  return 'Please input name';
                }

                return null;
              },
            ),
            TextFormField(
              controller: mobilecontroller,
              decoration: InputDecoration(
                  hintText: 'Input Mobile no',icon: Icon(Icons.person)

              ),
              validator: (value) {
                if(value==null || value.isEmpty){
                  return 'Please input Mobile no';
                }

                return null;
              },
            ),
            TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                  hintText: 'Input Password',icon: Icon(Icons.person)

              ),
              validator: (value) {
                if(value==null || value.isEmpty){
                  return 'Please input Password';
                }

                return null;
              },
            ),
            ElevatedButton(onPressed: (){
              if(formkey.currentState!.validate()){
                String name=namecontroller.text;
                String mobile=mobilecontroller.text;
                String password=passwordcontroller.text;


                UserInfo userinfo=UserInfo(
                    name: name,mobile: mobile,password: password
                );
                DbHelper.userInfo=userinfo;
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

              }
              }
             , child:Text('Creat Account'))
          ],
        ),
      ),
    );
  }
}
