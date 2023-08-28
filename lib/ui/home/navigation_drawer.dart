import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              // Implement the action when Home is tapped
            },
          ),
          ListTile(
            title: Text('New Registration'),
            onTap: () {
              // Implement the action when New Registration is tapped
            },
          ),
          ListTile(
            title: Text('Information'),
            onTap: () {
              // Implement the action when Information is tapped
            },
          ),
        ],
      ),
    );
  }
}
