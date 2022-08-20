import 'package:dio/dio.dart';
import './api_client.dart';

class AuthApi {
  login({required String email, required String password}) async {
    var response = await apiClient.post('/auth/login', data: {
      'email': email,
      'password': password,
    });

    return response.data;
  }
}
