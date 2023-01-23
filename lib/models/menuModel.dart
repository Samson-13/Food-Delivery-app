// class MenuModel {
//   late String id;
//   late String name;
//   String? description;
//   String? ownerId;
//   String? image;
//   String? ownerEmail;
//   MenuModel({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.image,
//     required this.ownerId,
//     required this.ownerEmail,
//   });

//   MenuModel.fromMap(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     image = json['image'];
//     ownerId = json['ownerId'];
//     ownerEmail = json['ownerEmail'];
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       "id":id,
//       "name": name,
//       "description": description,
//       "image": image,
//       "ownerId": ownerId,
//       "ownerEmail": ownerEmail,
//     };
//   }
// }