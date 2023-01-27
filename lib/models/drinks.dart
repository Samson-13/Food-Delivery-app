class DrinksModel {
  late String drinksId;
  late String drinksName;
  late String drinksDescriptions;
  late String drinksImage;
  DrinksModel({
    required this.drinksId,
    required this.drinksName,
    required this.drinksDescriptions,
    required this.drinksImage,
  });

  DrinksModel.fromMap(Map<String, dynamic> json) {
    drinksId = json['drinksId'];
    drinksName = json['drinksName'];
    drinksDescriptions = json['drinksDescriptions'];
    drinksImage = json['drinksImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      "drinksId": drinksId,
      "drinksName": drinksName,
      "drinksDescriptions": drinksDescriptions,
      "drinksImage": drinksImage,
    };
  }
}
