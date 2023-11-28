import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPage extends StatefulWidget{
  const StartPage({super.key});

  @override
  _StartWidget createState () => _StartWidget();
}

class _StartWidget extends State<StartPage>{
  
  Future<void> jumpMain() async{
    Future.delayed(const Duration(seconds: 3),(){
        Get.toNamed("/home");
    });
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
  Widget build(BuildContext context){
    jumpMain();
    return WillPopScope(onWillPop: _onExitApp,child: Container(width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height,color: Colors.white,child: Image.asset("images/ic_start_bg.png",fit: BoxFit.cover,),),);
  }
}