import 'package:flutter/material.dart';
import 'package:assistente_mecanico_poc/MapMarkerPage.dart';
import 'package:assistente_mecanico_poc/MapButtonPage.dart';
import 'page.dart';

final List<Page> _allPages = <Page>[
  MapMarkerPage(),
  MapButtonPage(),
];

class MapsDemo extends StatelessWidget {
  void _pushPage(BuildContext context, Page page) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(page.title),
                backgroundColor: Colors.red,
              ),
              body: page,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Flutter GoogleMaps'),
          backgroundColor: Colors.redAccent),
      body: ListView.builder(
        itemCount: _allPages.length,
        itemBuilder: (_, int index) => ListTile(
              leading: _allPages[index].leading,
              title: Text(_allPages[index].title),
              onTap: () => _pushPage(context, _allPages[index]),
            ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MapsDemo()));
}
