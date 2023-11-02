import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:kart_demo/A/colors.dart';
import 'package:kart_demo/firstPage.dart';
import 'package:kart_demo/secondpage.dart';
import 'package:kart_demo/thirdPage.dart';

class bottomNaviPage extends StatefulWidget {
  const bottomNaviPage({super.key});

  @override
  State<bottomNaviPage> createState() => _bottomNaviPageState();
}

class _bottomNaviPageState extends State<bottomNaviPage> {


  bool click=true;

  int Selectedindex=0;
  List<Widget> pages=[
   firstPage(),
    secondPage(),
    thirdPage()
  ];

  void onItemTapped(int index){
    setState(() {
      Selectedindex=index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[Selectedindex],
      bottomNavigationBar: ConvexAppBar(
        color: Colors.grey,

        backgroundColor: colors.secondarycolor,
        activeColor: colors.primarycolor,
        // height: width*0.2,
        // style: TabStyle.react,





        items: [
          TabItem(icon: Icons.home,title: "Home",),
          TabItem(icon: Icons.check_circle, title: 'Booked'),
          TabItem(icon: Icons.person, title: 'Person'),
        ],
        onTap: onItemTapped,


      ),
    );
  }
}
