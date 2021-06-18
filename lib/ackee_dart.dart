library ackee_dart;

import 'src/attrs.dart';
import 'src/send.dart';

export 'src/attrs.dart';

void startAckee(Uri url, String domainId, Attributes attributes) {
  start(url, domainId, attributes);
}
