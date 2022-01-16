import 'package:client/model/SessionState.dart';
import 'package:client/model/backend.dart';
import 'package:client/model/feature_point_store.dart';
import 'package:client/page/map_screen.dart';
import 'package:client/page/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final SessionState _sessionState;

  HomeScreen(this._sessionState);

  @override
  _HomeScreenState createState() => _HomeScreenState(_sessionState);
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  List<Widget> _pages;

  _HomeScreenState(SessionState sessionState) :
      this._pages =  <Widget>[
        Consumer<Backend>(
          builder: (context,backend, child) {
            return ProfileScreen(
                sessionState: sessionState,
                backend: backend,
            );
          },
        ),
        Consumer2<Backend, FeaturePointCache>(
          builder: (context, backend, featurePointCache, child) {
            return MapScreen(
              sessionState,
              featurePointCache,
              backend,
            );
          },
        )
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}