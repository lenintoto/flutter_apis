import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/phone_validation.dart';

class NumVerifyService {
  // Necesitarás registrarte en numverify.com para obtener una API key
  final String apiKey = '990a10bad33f48606380197c2ae55e55';
  final String baseUrl = 'http://apilayer.net/api/validate';

  Future<PhoneValidation> validatePhone(String phoneNumber) async {
    final response = await http.get(
      Uri.parse('$baseUrl?access_key=$apiKey&number=$phoneNumber'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return PhoneValidation.fromJson(data);
    } else {
      throw Exception('Failed to validate phone number');
    }
  }
}
