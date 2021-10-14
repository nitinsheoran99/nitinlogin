import 'package:flutter/material.dart';
import 'package:nitinlogin/View_page.dart';
import 'package:nitinlogin/dbhelper_page.dart';
import 'package:nitinlogin/expensinfo_page.dart';

class expens extends StatefulWidget {
  const expens({Key? key}) : super(key: key);

  @override
  _expensState createState() => _expensState();
}

class _expensState extends State<expens> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController feecontroller=TextEditingController();
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:formkey ,
        child: Column(
          children: [
          TextFormField(
          controller: namecontroller,
          decoration: InputDecoration(
              hintText: 'Student Name'
          ),
          validator: (value) {
            if(value==null || value.isEmpty){
              return 'Please input Student Name';
            }

            return null;
          },
        ),
        TextFormField(
          controller: feecontroller,
          decoration: InputDecoration(
              hintText: 'Student Fee'
          ),
          validator: (value) {
            if(value==null || value.isEmpty){
              return 'Please input Student Fee';
            }

            return null;
          },
        ),
        ElevatedButton(onPressed: (){
          if(formkey.currentState!.validate()){
            String name=namecontroller.text;
            String fee=feecontroller.text;
            String date=DateTime.now().toString();
            ExpensInfo userInfoList=ExpensInfo(
              name:name,fee:fee,date:date
            );
            DbHelper.expensList.add(userInfoList);
            namecontroller.text="";
            feecontroller.text="";
          }
        }, child: Text('Confirm')),

          ],
        ),
      ),
    );
  }
}
