

class ImageModel {

  late String  restauranImage;
  late String  restauranImage1;
  late String  restauranImage2;
  late String  restauranImage3;
  late String  restauranImage4;

  ImageModel({

    required this.restauranImage,
    required this.restauranImage1,
    required this.restauranImage2,
    required this.restauranImage3,
    required this.restauranImage4,

  });

  ImageModel.fromMap(Map<String, dynamic> json) {

    restauranImage = json['restauranImage'];
    restauranImage1 = json['restauranImage1'];
    restauranImage2 = json['restauranImage2'];
    restauranImage3 = json['restauranImage3'];
    restauranImage4 = json['restauranImage4'];

  }

  Map<String, dynamic> toMap() {
    return {

      "restauranImage": restauranImage,
      "restauranImage1": restauranImage1,
      "restauranImage2": restauranImage2,
      "restauranImage3": restauranImage3,
      "restauranImage4": restauranImage4,

    };
  }


}
