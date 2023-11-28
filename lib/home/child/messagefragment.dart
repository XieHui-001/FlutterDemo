import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../databean/hottopdatabean.dart';
import '../../service/api.dart';

class MessageFragmentPage extends StatefulWidget{
  const MessageFragmentPage({super.key});

  @override
  _MessageFragmentWidget createState () => _MessageFragmentWidget();
}

class _MessageFragmentWidget extends State<MessageFragmentPage>{

  Future<void> _refreshMessageData() async{
    List<HotTopData> dataList = [];

    final response = await ApiService.getRequest("boot/messageDataList");
    if(response.code == 200){
      if(response.data is List){
        List<HotTopData> list = (response.data as List<dynamic>).map((e) => HotTopData.fromJson((e as Map<String,dynamic>))).toList();
        setState(() {
          dataList = list;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return RefreshIndicator( onRefresh: _refreshMessageData,child: CustomScrollView(slivers: [
      SliverPadding(padding: const EdgeInsets.symmetric(vertical: 25),sliver:  SliverList(delegate: SliverChildBuilderDelegate((_,index){
        return InkWell(onTap: (){
          //
        },child: SizedBox(width: MediaQuery.of(context).size.width,child: Padding(padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),child: Column(children: [
          Card(shadowColor: Colors.grey,elevation: 15,child: ClipRRect(borderRadius: BorderRadius.circular(15),child: Image.network("https://images.pexels.com/photos/2286895/pexels-photo-2286895.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",fit: BoxFit.cover,),),)
        ],),),),);
      },childCount: 10),),)
    ],));
  }
}