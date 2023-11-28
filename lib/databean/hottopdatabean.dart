class HotTopData{
  String id;
  String title;
  String coverUrl;
  String txtContent;
  String createTime;
  String remark;

  HotTopData({required this.id,required this.title,required this.coverUrl,required this.txtContent,required this.createTime,required this.remark});

  factory HotTopData.fromJson(Map<String,dynamic> json){
    return HotTopData(id: json['id'], title: json['title'], coverUrl: json['coverUrl'], txtContent: json['txtContent'],createTime:json['createTime'], remark: json['remark']);
  }
}