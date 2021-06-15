# Ackee Dart Tracker
[Ackee](https://ackee.electerious.com/) tracker implemented in Dart (for both Dart and Flutter applications).


### Usage
```dart
import 'package:ackee_dart/ackee_dart.dart';

startAckee(
      Uri.parse('http://localhost:3000/api'),
      '3d8183e4-774b-45ad-9041-229338cb34a1',
      const Attributes(
        location: 'https://flutter2.app',
        ...
      ));
```


### Current limitations
- Events are not yet implemented


### How does this work
The `startAckee()` starts a tracker in an async method. First, it creates a record. If it fails, it waits for 5 seconds and tries again. Then, it just sends update requests every 10 seconds.


### License
MIT