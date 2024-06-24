import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../main.dart';
import '../../../models/model_product.dart';
import '../../../models/user_model.dart';
import '../../services.dart';
import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());
  UserModel? userModel;
  Address? address;

  //--------------------get USER profile --------------------
  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());
    var response = await http.get(
        Uri.parse(
          "https://unified-firmly-walleye.ngrok-free.app/api/user/profile/show",
        ),
        headers: {
          'Authorization': "Bearer $userToken",
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        });
    var responseData = jsonDecode(response.body);
    if (responseData["status"] == 200) {
      userModel = UserModel.fromJson(data: responseData["data"]);
      address = Address.fromJson(responseData["data"]["addresses"][0]);
      // debugPrint("response is : $responseData");
      emit(GetUserDataSuccessState());
    } else {
      // print("response is : $responseData");
      emit(FailedToGetUserDataState(
          error: responseData["message"], message: ''));
    }
  }

  //--------------------------get Products ------------------------
  List<ProductModel> products = [];
  List<Reviews> reviews = [];
  List<User> users = [];

  void getProducts() async {
    var response = await http.get(
        Uri.parse(
            "https://unified-firmly-walleye.ngrok-free.app/api/user/products/bestSeller"),
        headers: {
          'lang': "en",
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': userToken!,
        });
    var responseBody = jsonDecode(response.body);

    if (responseBody["status"] == 200) {
      // loop list
      for (var item in responseBody["data"]) {
        products.add(ProductModel.fromJson(data: item));
      }

      emit(GetProductsSuccessState());
    } else {
      emit(FailedToGetProductsState());
    }
  }

  //------------------- filtered products------------------------------
  List<ProductModel> filteredProducts = [];
  void filterProducts({required String input}) {
    filteredProducts = products
        .where((element) =>
            element.name!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
    emit(FilterProductsSuccessState());
  }

  //------------favorites -----------------------------------------------

  List<ProductModel> favorites = [];
  Set<String> favoritesID = {};
  Future<void> getFavorites() async {
    favorites.clear();
    var response = await http.get(
        Uri.parse(
            "https://unified-firmly-walleye.ngrok-free.app/api/user/products/Wishlist/mywishlist"),
        headers: {
          "lang": "en",
          "Authorization": "Bearer $userToken",
          "Accept": "application/json",
        });

    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      // loop list
      for (var item in responseBody['data']['data']) {
        // Refactoring
        favorites.add(ProductModel.fromJson(data: item['product']));
        favoritesID.add(item['product']['id'].toString());
      }
      print("Favorites number is : ${favorites.length}");
      emit(GetFavoritesSuccessState());
    } else {
      emit(FailedToGetFavoritesState());
    }
  }

  void addOrRemoveFromFavorites({required String productID}) async {
    var response = await http.post(
        Uri.parse(
            "https://unified-firmly-walleye.ngrok-free.app/api/user/products/Wishlist/add/$productID"),
        headers: {
          "lang": "en",
          "Authorization": "Bearer $userToken",
          "Accept": "application/json",
        },
        body: {
          "id": productID
        });
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      if (favoritesID.contains(productID) == true) {
        // delete
        favoritesID.remove(productID);
      } else {
        // add
        favoritesID.add(productID);
      }
      await getFavorites();
      emit(AddOrRemoveItemFromFavoritesSuccessState());
    } else {
      emit(FailedToAddOrRemoveItemFromFavoritesState());
    }
  }

  //-------Cart-------------------------------------------------

  List<ProductModel> carts = [];
  Set<String> cartsID = {};
  int totalPrice = 0;
  Future<void> getCarts() async {
    carts.clear();
    var response = await http.get(
        Uri.parse("https://unified-firmly-walleye.ngrok-free.app/api/cart"),
        headers: {
          "Authorization": "Bearer $userToken",
          "lang": "en",
          "Accept": "application/json",
        });

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseBody = jsonDecode(response.body);
      print(responseBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // success
        for (var item in responseBody["prodects"]) {
          cartsID.add(item['id'].toString());
          carts.add(ProductModel.fromJson(data: item));
        }
        totalPrice = responseBody["total"];
        print("Carts length is : ${carts.length}");
        emit(GetCartsSuccessState());
      } else {
        // failed
        emit(FailedToGetCartsState());
      }
    }
  }

  void addOrRemoveFromCarts({required String productID}) async {
    var response = await http.post(
        Uri.parse(
            "https://unified-firmly-walleye.ngrok-free.app/api/addToCart/$productID"),
        headers: {
          "lang": "en",
          "Authorization": "Bearer $userToken",
          'Accept': 'application/json',
        },
        body: {
          "id": productID,
          "product_qty": 1,
          "extra_price": 2.00,
          "product_color": "red",
          "product_size": "larg",
        });
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == 200) {
      if (cartsID.contains(productID) == true) {
        // delete
        cartsID.remove(productID);
      } else {
        // add
        cartsID.add(productID);
      }
      await getCarts();
      emit(AddOrRemoveItemFromCartsSuccessState());
    } else {
      emit(FailedToAddOrRemoveItemFromCartsState());
    }
  }
}

class LogoutController extends GetxController {
  MyServices myservices = Get.find();

  logout() {
    myservices.sharedPreferences.clear();
  }
}

  //products.add(ProductModel.fromJson(data: responseBody["product"]));
    // print("Products Data is : $responseBody");
    // for (var item in responseBody["data"]) {
    //   products.add(ProductModel.fromJson(data: item));
    // }

 // products.add(ProductModel.fromJson(data: responseBody["product"]));
      // reviews.add(Reviews.fromJson(data: responseBody["product"]["reviews"]));
      //users .add(User.fromJson(data: responseBody["product"]["reviews"]["user"]));


// List<ProductModel> products = [];
  // void getProducts() async {
  //   var response = (await http.get(
  //       Uri.parse("https://student.valuxapps.com/api/home"),
  //       headers: {'Authorization': userToken!, 'lang': "en"}));
  //   var responseBody = jsonDecode(response.body);

  //   /// print("Products Data is : $responseBody");
  //   // loop list
  //   if (responseBody['status'] == true) {
  //     for (var item in responseBody['data']['products']) {
  //       products.add(ProductModel.fromJson(data: item));
  //     }
  //     emit(GetProductsSuccessState());
  //   } else {
  //     emit(FailedToGetProductsState());
  //   }
  // }
