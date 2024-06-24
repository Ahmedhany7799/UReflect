import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../../../main.dart';
import '../../sharedprefernces/Cachedata.dart';
import 'authcubit_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  //--------register----------------------------------------------------

  void register(
      {required String email,
      required String name,
      required String phone,
      required String password}) async {
    emit(RegisterLoadingState());
    try {
      Response response = await http.post(
        Uri.parse('https://unified-firmly-walleye.ngrok-free.app/api/register'),
        body: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        },
      );
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        if (data["status"] == 201) {
          emit(RegisterSuccessState());
        } else {
          emit(FailedToRegisterState(message: data['message']));
        }
      }
    } catch (e) {
      debugPrint("Failed to Register , reason : $e");
      emit(FailedToRegisterState(message: e.toString()));
    }
  }

  //--------Login----------------------------------------------------

  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      Response response = await http.post(
        Uri.parse('https://unified-firmly-walleye.ngrok-free.app/api/login'),
        body: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data["status"] == 200) {
          debugPrint("Response is : $data");
          await CacheNetwork.insertToCache(
              key: "token", value: data["data"]["token"]);
          await CacheNetwork.insertToCache(key: "password", value: password);
          userToken = await CacheNetwork.getCacheData(key: "token");
          currentPassword = await CacheNetwork.getCacheData(key: "password");
          emit(LoginSuccessState());
        } else {
          debugPrint("Response is : $data");
          emit(FailedToLoginState(message: data["msg"]));
        }
      }
    } catch (e) {
      debugPrint("Failed to Login , reason : $e");
      emit(FailedToLoginState(message: e.toString()));
    }
  }
}
