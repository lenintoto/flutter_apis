class PhoneValidation {
  final bool valid;
  final String number;
  final String countryCode;
  final String countryName;
  final String location;
  final String carrier;
  final String lineType;

  PhoneValidation({
    required this.valid,
    required this.number,
    required this.countryCode,
    required this.countryName,
    required this.location,
    required this.carrier,
    required this.lineType,
  });

  factory PhoneValidation.fromJson(Map<String, dynamic> json) {
    return PhoneValidation(
      valid: json['valid'] ?? false,
      number: json['number'] ?? '',
      countryCode: json['country_code'] ?? '',
      countryName: json['country_name'] ?? '',
      location: json['location'] ?? '',
      carrier: json['carrier'] ?? '',
      lineType: json['line_type'] ?? '',
    );
  }
}
