import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'child/aboutfragment.dart';
import 'child/homefragment.dart';
import 'child/messagefragment.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget{

  @override
  _HomeWidget createState () => _HomeWidget();
}

class _HomeWidget extends State<HomePage>{

  int _index = 0;
  final List<Widget> pageList = [const HomeFragment(), const MessageFragmentPage(), const AboutFragmentPage()];

  @override
  void initState() {
    super.initState();
  }

  DateTime? currentBackTime;
  Future<bool> _onExitApp() async {
    DateTime now = DateTime.now();
    if (currentBackTime == null || now.difference(currentBackTime!) > const Duration(seconds: 2)) {
      currentBackTime = now;
      Get.snackbar("Exit prompt", "Press again to exit the app!");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: _onExitApp, child: Scaffold(
      body: IndexedStack(index: _index, children: pageList,),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _index,
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
        items:  [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon:Lottie.asset("images/ic_selected_home.json",animate: true,width: 30,height: 30,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.message_outlined),
            activeIcon: Lottie.asset("images/ic_selected_message.json",animate: true,width: 30,height: 30,),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_box_outlined),
            activeIcon: Lottie.asset("images/ic_selected_about.json",animate: true,width: 30,height: 30,),
            label: 'About',
          ),
        ],
        selectedFontSize: 12,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedFontSize: 12,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
      ),
    ));
  }
}