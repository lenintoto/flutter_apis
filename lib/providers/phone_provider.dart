import 'package:flutter/foundation.dart';
import '../services/numverify_service.dart';
import '../models/phone_validation.dart';

class PhoneProvider with ChangeNotifier {
  final NumVerifyService _numVerifyService = NumVerifyService();
  PhoneValidation? _phoneValidation;
  bool _isLoading = false;

  PhoneValidation? get phoneValidation => _phoneValidation;
  bool get isLoading => _isLoading;

  Future<void> validatePhone(String phoneNumber) async {
    _isLoading = true;
    notifyListeners();

    try {
      _phoneValidation = await _numVerifyService.validatePhone(phoneNumber);
    } catch (e) {
      print('Error validating phone: $e');
      _phoneValidation = null;
    }

    _isLoading = false;
    notifyListeners();
  }
}
