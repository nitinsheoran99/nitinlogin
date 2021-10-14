import 'package:flutter/material.dart';
import 'package:nitinlogin/dbhelper_page.dart';
import 'package:nitinlogin/expensinfo_page.dart';

class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  _viewState createState() => _viewState();
}

class _viewState extends State<view> {
   List<ExpensInfo>? expensList;

  void initState(){
    expensList=DbHelper.expensList??[];
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
   body: Container(
     height: MediaQuery.of(context).size.height,
     width: MediaQuery.of(context).size.width,
     child: Expanded(
       child: ListView.builder(
         itemCount: expensList?.length??0,
         shrinkWrap: true,
         itemBuilder: (context,index){
           ExpensInfo expenseInfo=expensList![index];
           return Container(
             decoration: BoxDecoration(
               border: Border.all(width: 2,color: Colors.blue),
               color: Colors.lightGreen[200]
             ),
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                 Text("Name:${expenseInfo.name}"),
                 Text("Name:${expenseInfo.fee}"),
               ],
             ),
           );
         }
       )
     ),
   ),
    );
  }
}
