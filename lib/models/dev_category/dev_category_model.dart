class DevCategoryModel {
  final String name;
  final String id;
  final String imagePath;
  final bool other;
  DevCategoryModel({
    required this.id,
    required this.name,
    required this.imagePath,
    this.other = false,
  });
}
