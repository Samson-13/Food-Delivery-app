class RestaurantModel {
  late String restaurantId;
  late String restaurantName;
  late String  restaurantDescription;
  late String  ownerId;
  late String  restauranImage;
  late String  ownerEmail;
  late String  restaurantPhone;
  late String  restaurantDetails;
  RestaurantModel({
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantDescription,
    required this.restauranImage,
    required this.ownerId,
    required this.ownerEmail,
    required this.restaurantPhone,
    required this.restaurantDetails,
  });

  RestaurantModel.fromMap(Map<String, dynamic> json) {
    restaurantId = json['restaurantId'];
    restaurantName = json['restaurantName'];
    restaurantDescription = json['restaurantDescription'];
    restauranImage = json['restauranImage'];
    ownerId = json['ownerId'];
    ownerEmail = json['ownerEmail'];
    restaurantPhone = json['restaurantPhone'];
    restaurantDetails = json['restaurantDetails'];
  }

  Map<String, dynamic> toMap() {
    return {
      "restaurantId": restaurantId,
      "restaurantName": restaurantName,
      "restaurantDescription": restaurantDescription,
      "restauranImage": restauranImage,
      "ownerId": ownerId,
      "ownerEmail": ownerEmail,
      "restaurantPhone": restaurantPhone,
      "restaurantDetails": restaurantDetails,
    };
  }
}
