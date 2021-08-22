import 'package:cozy_kos/models/space.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class SpaceProvider extends ChangeNotifier {
  List<Space> _spaces = [];

  List<Space> get spaces => _spaces;

  void setSpaces(List<Space> spaces) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _spaces = spaces;
      notifyListeners();
    });
  }
}
