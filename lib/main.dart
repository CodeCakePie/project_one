import 'package:flutter/material.dart';
import 'package:project_one/models/things_model.dart';
import 'package:project_one/screens/thing_details.dart';
import 'package:project_one/screens/things_overview.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThingsModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project One',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ThingsOverview(),
      onGenerateRoute: (settings) {
        var uri = Uri.parse(settings.name!);
        if (uri.path == '/') {
          return MaterialPageRoute(builder: (context) => ThingsOverview());
        }
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'details') {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context) => ThingDetails(id));
        }
        return MaterialPageRoute(builder: (context) => Scaffold());
      },
    );
  }
}
