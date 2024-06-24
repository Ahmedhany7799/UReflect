class UserModel {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? secondphone;
  List<Address>? addresses;
  String? address;
  // Constructor
  UserModel(
    this.name,
    this.email,
    this.secondphone,
    this.phone,
    this.image,
    this.addresses,
    this.address,
  );

  // Named constructor
  UserModel.fromJson({required Map<String, dynamic> data}) {
    // Refactoring Map | Json
    name = data["name"];
    email = data["email"];
    phone = data["mobile_number1"];
    image = data["image_profile"].toString();
    secondphone = data["mobile_number2"];
    // addresses:
    // List<Address>.from(data["addresses"].map((x) => Address.fromJson(x)));
  }

  // To Map
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "mobile_number1": phone,
      "mobile_number2": secondphone,
      "image_profile": image,
      "addresses": List<dynamic>.from(addresses!.map((x) => x.toJson())),
    };
  }
}

class Address {
  String streetAddress;
  String city;
  String state;

  Address({
    required this.streetAddress,
    required this.city,
    required this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        streetAddress: json["street_address"],
        city: json["city"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "street_address": streetAddress,
        "city": city,
        "state": state,
      };
}

// class UserModel {
//   String? name;
//   String? email;
//   String? imageProfile;
//   String? mobileNumber1;
//   String? mobileNumber2;
//   List<Address>? addresses;
//   late String? token;
//   int? id;
//   late String? address;
//
//   UserModel(this.name, this.email, this.imageProfile, this.mobileNumber1,
//       this.mobileNumber2, this.addresses, this.address, this.token, this.id);
//
//   UserModel.fromJson({required Map<String, dynamic> data}) {
//     name:
//     data["name"];
//     email:
//     data["email"];
//     imageProfile:
//     data["image_profile"];
//     mobileNumber1:
//     data["mobile_number1"];
//     mobileNumber2:
//     data["mobile_number2"];
//     addresses:
//     List<Address>.from(data["addresses"].map((x) => Address.fromJson(x)));
//   }
//   Map<String, dynamic> toMap() {
//     return {
//       "name": name,
//       "email": email,
//       "image_profile": imageProfile,
//       "mobile_number1": mobileNumber1,
//       "mobile_number2": mobileNumber2,
//       "addresses": List<dynamic>.from(addresses!.map((x) => x.toJson())),
//     };
//   }
// }
//

// // To parse this JSON data, do

// //     final userModel = userModelFromJson(jsonString);

// // UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// // String userModelToJson(UserModel data) => json.encode(data.toJson());

// // class UserModel {
// //   String name;
// //   String email;
// //   String imageProfile;
// //   String mobileNumber1;
// //   String mobileNumber2;
// //   List<Address> addresses;

// //   UserModel({
// //     required this.name,
// //     required this.email,
// //     required this.imageProfile,
// //     required this.mobileNumber1,
// //     required this.mobileNumber2,
// //     required this.addresses,
// //   });

// //   Map<String, dynamic> toJson() => {
// //         "name": name,
// //         "email": email,
// //         "image_profile": imageProfile,
// //         "mobile_number1": mobileNumber1,
// //         "mobile_number2": mobileNumber2,
// //         "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
// //       };
// // }

// // class Address {
// //   String streetAddress;
// //   String city;
// //   String state;

// //   Address({
// //     required this.streetAddress,
// //     required this.city,
// //     required this.state,
// //   });

// //   factory Address.fromJson(Map<String, dynamic> json) => Address(
// //         streetAddress: json["street_address"],
// //         city: json["city"],
// //         state: json["state"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "street_address": streetAddress,
// //         "city": city,
// //         "state": state,
// //       };
// // }

class AiModel {
  String? image;

  // Constructor
  AiModel(
    this.image,
  );

  // Named constructor
  AiModel.fromJson({required Map<String, dynamic> data}) {
    // Refactoring Map | Json

    image = data["image_profile"].toString();
  }

  // To Map
  Map<String, dynamic> toMap() {
    return {
      "image_profile": image,
    };
  }
}
