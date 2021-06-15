// only send data
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'attrs.dart';

/// url - URL to the API (`http://localhost:3000/api`)
Future<void> start(Uri url, String domainId, Attributes attributes) async {
  String? recordId;

  while (recordId == null) {
    try {
      final req = await send(
          url, getCreateRecordBody(domainId, attributes), attributes);

      recordId = req['data']['createRecord']['payload']['id'] as String;
    } catch (e) {
      print('error sending analytics $e');
      await Future.delayed(const Duration(seconds: 5));
    }
  }

  while (true) {
    await Future.delayed(const Duration(seconds: 10));

    await send(url, getUpdateRecordBody(recordId), attributes);
  }
}

Future<Map> send(Uri url, Map body, Attributes attrs) async {
  final r = await http.post(
    url,
    body: jsonEncode(body),
    headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'User-Agent':
          '${attrs.browserName} (${attrs.browserVersion}) ${Platform.operatingSystem} (${Platform.operatingSystemVersion})',
    },
  );

  return jsonDecode(r.body) as Map;
}

Map getCreateRecordBody(String domainId, Attributes attrs) => {
      'query': '''
        mutation createRecord(\$domainId: ID!, \$input: CreateRecordInput!) {
          createRecord(domainId: \$domainId, input: \$input) {
            payload {
              id
            }
          }
        }
      ''',
      'variables': {
        'domainId': domainId,
        'input': attrs.json,
      }
    };

Map getUpdateRecordBody(String recordId) => {
      'query': '''
        mutation updateRecord(\$recordId: ID!) {
          updateRecord(id: \$recordId) {
            success
          }
        }
      ''',
      'variables': {'recordId': recordId}
    };
