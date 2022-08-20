import 'package:dio/dio.dart';

final apiClient = Dio(
  BaseOptions(baseUrl: 'https://jwt-auth-api.vercel.app', headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  }),
);
