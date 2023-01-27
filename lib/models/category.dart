class CategoryModel {
  late String categoryId;
  late String categoryName;
  late String categoryDescription;
  late String categoryImage;
  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.categoryDescription,
    required this.categoryImage,
  });

  CategoryModel.fromMap(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    categoryDescription = json['categoryDescription'];
    categoryImage = json['categoryImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      "categoryId": categoryId,
      "categoryName": categoryName,
      "categoryDescription": categoryDescription,
      "categoryImage": categoryImage,
    };
  }
}
