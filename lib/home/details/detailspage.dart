import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatefulWidget {
  String? tag;
  String? content;
  String? coverUrl;

  DetailsPage({super.key, this.tag, this.content, this.coverUrl});

  @override
  _DetailsWidget createState() => _DetailsWidget();
}

class _DetailsWidget extends State<DetailsPage> {
  Map<String, dynamic> parameters = Get.parameters;

  String tag = '';
  String content = '';
  String coverUrl = '';

  @override
  void initState() {
    super.initState();
    tag = parameters['tag'] ?? widget.tag ?? '';
    content = parameters['content'] ?? widget.content ?? '';
    coverUrl = parameters['coverUrl'] ?? widget.coverUrl ?? '';
  }

  Future<void> _detailsDataRefresh() async{

  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator( onRefresh: _detailsDataRefresh,child: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
                tag: tag,
                child: FadeInImage.assetNetwork(
                  placeholder: "images/ic_loading.gif",
                  image: coverUrl,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        content,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ));
              }, childCount: 1)),
        )
      ],
    ),);
  }
}
