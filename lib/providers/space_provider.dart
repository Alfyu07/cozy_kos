import 'dart:convert';

import 'package:cozy_kos/models/space.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  Future<List<Space>?> getRecommendedSpace() async {
    final Uri uri =
        Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces');
    final result = await http.get(uri);

    if (result.statusCode == 200) {
      final List data = jsonDecode(result.body) as List;

      List<Space>? spaces =
          data.map((e) => Space.fromJson(e as Map<String, dynamic>)).toList();

      return spaces;
    }

    return <Space>[];
  }
}
