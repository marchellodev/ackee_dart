```dart
import 'package:ackee_dart/ackee_dart.dart';
import 'package:ackee_dart/attrs.dart';

/// for Dart
void main() {
  startAckee(
      Uri.parse('http://localhost:3000/api'),
      '3d8183e4-774b-45ad-9041-229338cb34a1',
      Attributes(
        location: 'https://dart.app/page1',
        // todo add more parameters for analytics
      ));
}

/// for Flutter
void analytics(BuildContext context) {
  startAckee(
      Uri.parse('https://server.app/api'),
      '0a143aeb-7105-449f-a2be-ed03b5674e96',
      Attributes(
        location: 'https://sharik.app',
        osName: Platform.operatingSystem,
        osVersion: Platform.operatingSystemVersion,

        /// referrer needs to be a valid link!
        referrer: sourceFromWhichUserInstalledTheApp(),
        screenWidth: MediaQuery
            .of(context)
            .size
            .width,
        screenHeight: MediaQuery
            .of(context)
            .size
            .height,
        browserWidth: MediaQuery
            .of(context)
            .size
            .width,
        browserHeight: MediaQuery
            .of(context)
            .size
            .height,
        browserName: 'My Awesome App',
        browserVersion: currentVersion,
        deviceName: Platform.localHostname,
        deviceManufacturer: Platform.operatingSystem,
        language: Localizations
            .localeOf(context)
            .languageCode,
      ));
}
```