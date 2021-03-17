import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThingsAppBar extends StatelessWidget {
  const ThingsAppBar({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(title),
      floating: true,
    );
  }
}
