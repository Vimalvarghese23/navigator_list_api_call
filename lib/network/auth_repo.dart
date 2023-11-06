import 'package:dio/dio.dart';

import 'package:navigator/network/deo_clint.dart';
import 'package:navigator/network/end_points.dart';
import 'package:navigator/request%20class/login_request.dart';
import 'package:navigator/response%20class/login_response.dart';
import 'package:navigator/response%20class/user_response.dart';

class AuthRepo {
  final DioClient dioClient = DioClient(Dio());
  Future<LoginResponse?> loginRequest(LoginRequest loginRequest) async {
    try {
      final response = await dioClient.post(
        endpoints: Endpoints.login,
        data: loginRequest.toJson(),
      );
      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(response.data);
        if (loginResponse.token != null) {
          return loginResponse;
        } else {
          return null;
        }
      } else {
        final loginResponse = LoginResponse.fromJson(response.data);
        if (response.statusCode == 400) {
          return loginResponse;
        }
        ;
      }
      // return response.data.toString();
    } on DioException catch (e) {
      print(e);
      if (e.response?.data != null) {
        final errResp = LoginResponse.fromJson(e.response!.data);
        return errResp;
        // if (errResp.error != null) {
        //   // code for snackbar
        //   return null;
        // } else {
        //   return e.toString();
        // }
      }

      return null;
    }
    return null;
  }

  Future<UserList?> UserResponse() async {
    try {
      final response = await dioClient.post(
        endpoints: Endpoints.UserList,
      );
      print(response);
      if (response.statusCode == 200) {
        final userResponse = UserList.fromJson(response.data);
        if (userResponse.data != null) {
          return userResponse;
        } else {
          return UserList(error: "No data");
        }
      } else {
        final userResponse = UserList.fromJson(response.data);
        if (response.statusCode == 400) {
          return userResponse;
        }
        ;
      }
      // return response.data.toString();
    } on DioException catch (e) {
      print(e);
      if (e.response?.data != null) {
        final userErrorResponse = UserList.fromJson(e.response!.data);
        return userErrorResponse;
        // if (errResp.error != null) {
        //   // code for snackbar
        //   return null;
        // } else {
        //   return e.toString();
        // }
      }

      return null;
    }
    return null;
  }
}
