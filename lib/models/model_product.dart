class ProductModel {
  String? name;
  String? description;
  String? image;
  //late List<String> images;

  int? price;
  int? views;
  int? id;
  int? discount;

  // Named constructor | refactoring
  ProductModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'];
    description = data['name'].toString();

    name = data['name'].toString();
    image = data['model_image'].toString();
    // if (data['images'] != null) {
    //   images = [];
    //   data['images'].forEach((v) {
    //     images.add(v.toString());
    //   });
    // }
    price = data['original_price'];
    views = data['views'];
  }

  // int? id;
  // String? name;
  // String? description;
  // int? price;
  // int? quantity;
  // List? image;
  // String? categoryName;
  // List<Reviews>? reviews;

  // ProductModel.fromJson({
  //   required Map<String, dynamic> data,
  // }) {
  //   id = data['id'];
  //   name = data['name'];
  //   description = data['description'];
  //   price = data['original_price'];
  //   //image = data['images'];

  //   categoryName = data['category_name'];
  //   if (data['reviews'] != null) {
  //     data['reviews'].forEach((v) {
  //       reviews!.add(Reviews.fromJson(data: {}));
  //     });
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['description'] = description;
  //   data['original_price'] = price;
  //   data['quantity'] = quantity;

  //   data['images'] = image;
  //   data['category_name'] = categoryName;

  //   return data;
  // }
}

class Reviews {
  int? rating;
  String? review;
  User? user;
  Reviews({this.rating, this.review, this.user});

  Reviews.fromJson({
    required Map<String, dynamic> data,
  }) {
    rating = data['rating'];
    review = data['review'];
    user = data['user'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['rating'] = this.rating;
  //   data['review'] = this.review;
  //   if (this.user != null) {
  //     data['user'] = this.user.toJson();
  //   }
  //   return data;
  // }
}

class User {
  int? id;
  String? name;
  String? image;

  User.fromJson({
    required Map<String, dynamic> data,
  }) {
    id = data['id'];
    name = data['name'];
    image = data['image'];
  }
}
