import 'package:dio/dio.dart';
import 'package:hiero_company/core/api/api_baseservice.dart';
import 'package:hiero_company/core/config/api_endpoints.dart';
import 'package:hiero_company/infrastructure/models/jobmodel.dart';

class JobRepository {
  final Dio dio = Dio();
  final baseApiService = BaseApiService();
  Future<String> addJob(JobModel jobmodel, String accessToken) async {
    final response = await baseApiService.postApiCall(
        accessToken, ApiEndpoints.addJobEndpoint,
        body: jobmodel.toJson());
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
        print('Signup failed with status code: ${response.statusCode}');
        return errorMessage;
      }
    } else {
      return 'Sorry, Server is not reachable 🥲';
    }
  }
}
