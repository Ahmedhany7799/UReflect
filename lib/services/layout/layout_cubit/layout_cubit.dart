import 'dart:convert';
import 'package:UReflect/models/user_model.dart';
import 'package:bloc/bloc.dart';

import '../../../main.dart';
import 'layout_states.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());
  UserModel? userModel;
  Address? address;

  Future<void> getUserData() async {
    emit(GetUserDataLoadingState());
    Response response = await http.get(
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

// class UserModel {
//   String? name;
//   String? email;
//   String? imageProfile;
//   String? mobileNumber1;
//   String? mobileNumber2;

//   // Constructor
//   UserModel(
//     this.name,
//     this.email,
//     this.imageProfile,
//     this.mobileNumber1,
//     this.mobileNumber2,
//   );

//   // Named constructor
//   UserModel.fromJson({required Map<String, dynamic> data}) {
//     // Refactoring Map | Json
//     name = data["name"];
//     email = data["email"];
//     mobileNumber1 = data["mobile_number1"];
//     mobileNumber2 = data["mobile_number2"];
//     imageProfile = data["image_profile"];
//   }

//   // To Map
//   Map<String, dynamic> toMap() {
//     return {
//       "name": name,
//       "email": email,
//       "mobile_number1": mobileNumber1,
//       "mobile_number2": mobileNumber2,
//       "image_profile": imageProfile,
//     };
//   }
// }
}
