import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hiero_company/core/api/api_baseservice.dart';
import 'package:hiero_company/core/config/api_endpoints.dart';
import 'package:hiero_company/infrastructure/models/jobmodel.dart';

class JobRepository {
  final Dio dio = Dio();
  final baseApiService = BaseApiService();
  Future<String> addJob(JobModel jobmodel, String accessToken) async {
    log(jobmodel.toJson().toString());
    final response = await baseApiService.postApiCall(
      accessToken,
      ApiEndpoints.addJobEndpoint,
      body: jobmodel.toJson(),
    );
    log(response.toString());
    if (response != null) {
      if (response.statusCode == 201 && response.statusCode == 200) {
        return 'success';
      } else {
        String errorMessage = '';
        if (response.data['message'] == 'Invalid Token') {
          errorMessage = 'Please authenticate once more.😖';
        } else {
          errorMessage = response.data['message'];
        }
        return errorMessage;
      }
    } else {
      return 'Sorry, Server is not reachable 😖';
    }
  }

  Future<dynamic> getAllJob(String accessToken) async {
    final response = await baseApiService.getApiCall(
        accessToken, ApiEndpoints.getAllJobEndpoint);
    if (response != null) {
      print(response.data['data']);
      if (response.data['status_code'] == 201 ||
          response.data['status_code'] == 200) {
        log(response.data['data'].toString());
        return response.data['data']
            .map((map) => JobModel.fromJson(map))
            .toList();
      } else {
        String errorMessage = '';
        if (response.data['error'] == 'user already exist, sign in') {
          errorMessage = response.data['error'];
        } else {
          errorMessage = response.data['message'];
        }
        print(errorMessage);
        print('Get Job failed with status code: ${response.statusCode}');
        return response.data['error'];
      }
    } else {
      return 'Sorry, Server is not reachable 🥲';
    }
  }

  Future<dynamic> updateJob(JobModel jobmodel, String accessToken) async {
    final response = await baseApiService.putApiCall(
        accessToken, "${ApiEndpoints.updateJobEndpoint}/${jobmodel.id}");
    if (response != null) {
      if (response.statusCode == 201 && response.statusCode == 200) {
        return 'success';
      } else {
        String errorMessage = '';
        if (response.data['error'] == 'user already exist, sign in') {
          errorMessage = response.data['error'];
        } else {
          errorMessage = response.data['message'];
        }
        print(errorMessage);
        print('Update Job failed with status code: ${response.statusCode}');
        return errorMessage;
      }
    } else {
      return 'Sorry, Server is not reachable 🥲';
    }
  }

  Future<dynamic> deleteJob(JobModel jobmodel, String accessToken) async {
    final response = await baseApiService.deleteApiCall(
        accessToken, ApiEndpoints.deleteJobEndpoints, jobmodel.id ?? 0);
    if (response != null) {
      if (response.statusCode == 201 && response.statusCode == 200) {
        return 'success';
      } else {
        String errorMessage = '';
        if (response.data['error'] == 'user already exist, sign in') {
          errorMessage = response.data['error'];
        } else {
          errorMessage = response.data['message'];
        }
        print(errorMessage);
        print('Update Job failed with status code: ${response.statusCode}');
        return errorMessage;
      }
    } else {
      return 'Sorry, Server is not reachable 🥲';
    }
  }
}
