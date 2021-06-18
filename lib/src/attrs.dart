import 'dart:convert';

/// Defines what kind of data is sent to the Ackee server
/// Please keep in mind that `browserName`, `browserVersion`, `osName`, and `osVersion` are used to generate User Agent.
/// In Ackee, User Agent is combined with IP to calculate the unique identifier for each user ()
class Attributes {
  /// Current URL of your website/app
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
  final double? browserWidth;
  final double? browserHeight;

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
