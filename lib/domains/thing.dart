import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class Thing {
  final String id;
  final String name;
  final String description;
  Thing({
    required this.id,
    required this.name,
    required this.description,
  });

  Thing copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return Thing(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory Thing.fromMap(Map<String, dynamic> map) {
    return Thing(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Thing.fromJson(String source) => Thing.fromMap(json.decode(source));

  @override
  String toString() => 'Thing(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Thing &&
        other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
