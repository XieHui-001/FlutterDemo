class HotTopData{
  String id;
  String title;
  String coverUrl;
  String textContent;
  String createTime;
  String remark;

  HotTopData({required this.id,required this.title,required this.coverUrl,required this.textContent,required this.createTime,required this.remark});

  factory HotTopData.fromJson(Map<String,dynamic> json){
    return HotTopData(id: json['id'], title: json['title'], coverUrl: json['coverUrl'], textContent: json['textContent'],createTime:json['createTime'], remark: json['remark']);
  }
}