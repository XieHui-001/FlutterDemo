class BaseResponse{
  int code;
  dynamic data;
  String remark;

  BaseResponse({
    required this.code,
    required this.data,
    required this.remark,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
        code: json['code'] as int,
        data:json['data'],
        remark: json['remark']);
  }
}