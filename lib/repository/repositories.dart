import 'dart:convert';
import 'package:http/http.dart';
import 'package:sistema_peccioli_2/responses/home_response.dart';


class Repository {
  final Map<String, String> _authParams = {
    "grant_type": "password",
    "username": "info@dieffetech.it",
    "password": "Dieffetech!2018",
    "client_id": "dieffetech",
    "client_secret": "AlPufGt45F4d212BBB"
  };

  String apiUrl = 'https://peccioli2.dieffetech.it/web';


  Future<HomeResponse?> getHome() async {
    final tokenResponse = await post(
      Uri.parse('$apiUrl/oauth2/token'),
      body: _authParams,
    );
    if (tokenResponse.statusCode == 200) {
      final accessToken = jsonDecode(tokenResponse.body)['access_token'];
      final homeResponse = await post(
        Uri.parse('$apiUrl/web-service/get-home'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );
      if (homeResponse.statusCode == 200) {
        final json = jsonDecode(homeResponse.body);
        return HomeResponse.fromJson(json);
      } else {
        print('Si è verificato un errore: ${homeResponse.reasonPhrase}');
      }
    } else {
      print('Si è verificato un errore: ${tokenResponse.reasonPhrase}');
      //throw Exception(response.reasonPhrase);
    }
    return null;
  }
}
