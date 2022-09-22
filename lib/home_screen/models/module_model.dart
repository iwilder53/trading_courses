class Module {
  String id;
  String name;
  List<String> videos;
  bool isExpanded;

  Module({
    required this.id,
    required this.name,
    required this.videos,
    this.isExpanded = false,
  });
}
