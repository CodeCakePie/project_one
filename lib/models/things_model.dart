import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:project_one/domains/thing.dart';

class ThingsModel extends ChangeNotifier {
  List<Thing> _things = [
    Thing(id: 'id', name: 'name', description: 'description')
  ];
  UnmodifiableListView<Thing> get things => UnmodifiableListView(_things);

  Thing getById(String id) {
    return this._things.firstWhere((element) => element.id == id);
  }

  Thing getByPosition(int position) {
    return this._things[position];
  }

  void addThing(Thing thing) {
    this._things.add(thing);
    notifyListeners();
  }

  void remove() {
    this._things.clear();
    notifyListeners();
  }
}
