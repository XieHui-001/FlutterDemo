import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tools/utils/base64utils.dart';
import 'package:get/get.dart';
import '../../databean/hottopdatabean.dart';
import '../../service/api.dart';

class MessageFragmentPage extends StatefulWidget{
  const MessageFragmentPage({super.key});

  @override
  _MessageFragmentWidget createState () => _MessageFragmentWidget();
}

class _MessageFragmentWidget extends State<MessageFragmentPage>{
  List<HotTopData> dataList = [];

  Future<void> _refreshMessageData() async{
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
  void initState() {
    super.initState();
    _refreshMessageData();
  }

  @override
  Widget build(BuildContext context){
    return RefreshIndicator( onRefresh: _refreshMessageData,child: CustomScrollView(slivers: [
      SliverPadding(padding: const EdgeInsets.symmetric(vertical: 25),sliver:  SliverList(delegate: SliverChildBuilderDelegate((_,index){
        return InkWell(onTap: (){
          Get.toNamed("/detail", parameters: {
            "content":
            Base64Utils.decrypt(dataList[index].remark),
            "tag": "${dataList[index].coverUrl}sss",
            "coverUrl":
            Base64Utils.decrypt(dataList[index].coverUrl)
          });
        },child: SizedBox(width: MediaQuery.of(context).size.width,child: Padding(padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),child: Column(children: [
          Card(shadowColor: Colors.grey,elevation: 15,child: ClipRRect(borderRadius: BorderRadius.circular(15),child: FadeInImage.assetNetwork(placeholder: "images/ic_loading.gif", image: Base64Utils.decrypt(dataList[index].coverUrl),fit: BoxFit.cover,),),)
        ],),),),);
      },childCount: dataList.length),),)
    ],));
  }
}