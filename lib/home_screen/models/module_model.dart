class Module {
  late  String id;
 late String name;
 late List<String> videos;
 late bool isExpanded;

  Module({
    required this.id,
    required this.name,
    required this.videos,
    this.isExpanded = false,
  });

  Module.fromJson(Map<String, dynamic> json) {
  final  videos = List.castFrom<dynamic, String>(json['videos']);
  final  id = json['_id'];
  final  name = json['name'];
  }
}
