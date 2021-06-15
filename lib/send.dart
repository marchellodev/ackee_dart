// only send data
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'attrs.dart';

/// url - URL to the API (`http://localhost:3000/api`)
Future<void> start(Uri url, String domainId, Attributes attributes) async {
  String? recordId;

  while (recordId == null) {
    try {
      final req = await send(url, getCreateRecordBody(domainId, attributes));

      recordId = req['data']['createRecord']['payload']['id'] as String;
    } catch (e) {
      print('err');
      await Future.delayed(const Duration(seconds: 5));
    }
  }

  while (true) {
    print('sending update');
    await Future.delayed(const Duration(seconds: 15));

    await send(url, getUpdateRecordBody(recordId));
  }
}

Future<Map> send(Uri url, Map body) async {
  final r = await http.post(
    url,
    body: jsonEncode(body),
    headers: {'Content-Type': 'application/json;charset=UTF-8'},
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