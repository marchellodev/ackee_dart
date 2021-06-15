import 'dart:convert';

class Attributes {
  // required

  /// website url
  /// NEEDS TO BE A VALID URL
  final String location;

  /// NEEDS TO BE A VALID URL
  final String? referrer;
  final String? source;

  // only for detailed
  /// ru, en, etc
  final String? language;
  final double? screenWidth;
  final double? screenHeight;

  final int? screenColorDepth;

  final String? deviceName;
  final String? deviceManufacturer;
  final String? osName;

  final String? osVersion;

  final String? browserName;
  final String? browserVersion;
  final String? browserWidth;
  final String? browserHeight;

  const Attributes({
    required this.location,
    this.referrer,
    this.source,
    //
    this.language,
    this.screenWidth,
    this.screenHeight,
    this.screenColorDepth,
    this.deviceName,
    this.deviceManufacturer,
    this.osName,
    this.osVersion,
    this.browserName,
    this.browserVersion,
    this.browserWidth,
    this.browserHeight,
  });

  Map get json => {
        'siteLocation': location,
        'siteReferrer': referrer,
        'source': source,
        'siteLanguage': language,
        'screenWidth': screenWidth,
        'screenHeight': screenHeight,
        'screenColorDepth': screenColorDepth,
        'deviceName': deviceName,
        'deviceManufacturer': deviceManufacturer,
        'osName': osName,
        'osVersion': osVersion,
        'browserName': browserName,
        'browserVersion': browserVersion,
        'browserWidth': browserWidth,
        'browserHeight': browserHeight,
      };

  @override
  String toString() {
    return jsonEncode(json);
  }
}
