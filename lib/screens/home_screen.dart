import 'package:adminforhamropalika/screens/newsfeed/newsfeed.dart';
import 'package:adminforhamropalika/screens/notice/notice.dart';
import 'package:adminforhamropalika/screens/watersupply/water_supply.dart';
import 'package:flutter/material.dart';






class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Hamro Palika Admin ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
        backgroundColor: Colors.green,
      ),

      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>ComplaintListScreen()));
            },
            child: Container(
              height: 100,
              width: 200,
              color: Colors.green,
              child: Center(child: Text("Water supply",style: TextStyle(fontWeight: FontWeight.bold,),)),
            ),
          ),
           InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>UserNewsFeed()));
            },
            child: Container(
              height: 100,
              width: 200,
              color: Colors.green,
              child: Center(child: Text("NewsFeed",style: TextStyle(fontWeight: FontWeight.bold,),)),
            ),
          ),

            InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SendNotice()));
            },
            child: Container(
              height: 100,
              width: 200,
              color: Colors.green,
              child: Center(child: Text("Send Notice",style: TextStyle(fontWeight: FontWeight.bold,),)),
            ),
          ),
        ],
      ),
    );
  }
}