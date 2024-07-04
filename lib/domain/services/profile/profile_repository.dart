import 'package:dio/dio.dart';
import 'package:hiero_company/core/api/api_baseservice.dart';
import 'package:hiero_company/core/config/api_endpoints.dart';
import 'package:hiero_company/infrastructure/models/companymodels.dart';

class ProfileRepository {
  final Dio dio = Dio();
  final baseApiService = BaseApiService();
  Future<dynamic> getCompanyProfile(String accessToken) async {
    final response = await baseApiService.getApiCall(
        accessToken, ApiEndpoints.getCompanyEndpoints);
    if (response != null) {
      if (response.statusCode == 201 && response.statusCode == 200) {
        return response.data['data']
            .map((map) => CompanyModel.fromJson(map))
            .toList();
      } else {
        String errorMessage = '';
        errorMessage = response.data['error'];
        return errorMessage;
      }
    } else {
      return 'Sorry, Server is not reachable 🥲';
    }
  }
}
