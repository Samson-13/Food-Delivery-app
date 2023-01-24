class RestaurantModel {
  late String restaurantId;
  late String restaurantName;
  late String restaurantDescription;
  String? ownerId;
  String? restauranImage;
  String? ownerEmail;
  RestaurantModel({
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantDescription,
    required this.restauranImage,
    required this.ownerId,
    required this.ownerEmail,
  });

  RestaurantModel.fromMap(Map<String, dynamic> json) {
    restaurantId = json['restaurantId'];
    restaurantName = json['restaurantName'];
    restaurantDescription = json['restaurantDescription'];
    restauranImage = json['restauranImage'];
    ownerId = json['ownerId'];
    ownerEmail = json['ownerEmail'];
  }

  Map<String, dynamic> toMap() {
    return {
      "restaurantId": restaurantId,
      "restaurantName": restaurantName,
      "restaurantDescription": restaurantDescription,
      "restauranImage": restauranImage,
      "ownerId": ownerId,
      "ownerEmail": ownerEmail,
    };
  }
}
