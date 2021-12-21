import '../entity/province.dart';

class ProvinceMapper {
  static List<Province> fromJson(dynamic json) {
    final emblemList = json["lambang"] as List;
    return emblemList.map((e) => createProvince(e)).toList();
  }

  static Province createProvince(Map<String, dynamic> json) {
    return Province(
      index: json["index"],
      title: json["title"],
      url: json["url"],
    );
  }
}
