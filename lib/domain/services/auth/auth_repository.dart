import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:hiero_company/core/api/api_baseservice.dart';
import 'package:hiero_company/core/config/api_config.dart';
import 'package:hiero_company/infrastructure/helper/sharedpreference.dart';
import 'package:hiero_company/infrastructure/models/usermodels.dart';

class AuthRepository {
  final Dio dio = Dio();
  String signupEndpoint = '/employer/signup';
  String loginEndpoint = '/employer/login';

  Future<String> signup(CompanyModel companyModel) async {
    log(companyModel.toJson().toString());
    try {
      final response = await dio.post(
        '${AppDevConfig.baseURL}$signupEndpoint',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
          },
        ),
        data: companyModel.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Signup successful!');
        final data = response.data;
        final token = data['data']['Token'];
        SharedPreferenceClass().saveAccessTokenStatus(token);
        AppDevConfig.accessToken = token;
        return 'success';
      } else {
        String errorMessage = '';
        if (response.data['error'] == 'user already exist, sign in') {
          errorMessage = response.data['error'];
        } else {
          errorMessage = response.data['message'];
        }
        log(errorMessage);
        print('Signup failed with status code: ${response.statusCode}');
        return errorMessage;
      }
    } catch (e) {
      if (e is DioException) {
        handleApiError('Post', e);
        return e.response?.data['error'];
      } else {
        debugPrint('Get Request Error: $e');
        return e.toString();
      }
    }
  }

  Future<String> login(CompanyModel companyModel) async {
    try {
      final response = await dio.post('${AppDevConfig.baseURL}$loginEndpoint',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'accept': 'application/json',
            },
          ),
          data: companyModel.logintoJson());
      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Login successful!');
        final data = response.data;
        final token = data['data']['Token'];
        print('token:$token');
        SharedPreferenceClass().saveAccessTokenStatus(token);
        AppDevConfig.accessToken = token;
        return 'success';
      } else {
        String errorMessage = '';
        if (response.data['error'] == 'user already exist, sign in') {
          errorMessage = response.data['error'];
        } else {
          errorMessage = response.data['message'];
        }

        return errorMessage;
      }
    } catch (e) {
      if (e is DioException) {
        handleApiError('Post', e);

        return e.response?.data['error'];
      } else {
        debugPrint('Get Request Error: $e');
        return e.toString();
      }
    }
  }
}
