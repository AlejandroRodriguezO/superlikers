import 'package:superlikers/core/constants/environment.dart';

class ApiUrls {
  //base url
  static const String baseUrl = Env.baseUrl;

  static const String apiKey = Env.apiKey;

  //Signin
  static const String signInPath = '/v1/microsite/sessions';
  static const String entriesPath = '/v1/entries/index';
}
