import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_one/domains/thing.dart';
import 'package:project_one/models/things_model.dart';
import 'package:provider/provider.dart';

class ThingDetails extends StatelessWidget {
  final String id;
  const ThingDetails(this.id);

  @override
  Widget build(BuildContext context) {
    final Thing thing =
        context.select<ThingsModel, Thing>((value) => value.getById(id));
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
    );
  }
}
