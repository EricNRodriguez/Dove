import 'package:client/model/backend.dart';
import 'package:client/model/feature_point_store.dart';
import 'package:client/page/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // TODO(ericr): parse from shared config
  Backend backend = Backend("http", "10.0.2.2", 8080);

  runApp(
      MultiProvider(
        providers: [
          Provider(create: (context) => backend),
          ChangeNotifierProvider(create: (_) => FeaturePointCache(backend)),
        ],
        child: MaterialApp(
          home: WelcomeScreen(),
        ),
      ),
  );
}