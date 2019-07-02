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
                leading: Icon(
                  Icons.menu,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  page.title,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                backgroundColor: Colors.white,
              ),
              body: page,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(children: <Widget>[
          DrawerHeader(
            child: Icon(
              Icons.home,
              color: Color(0xFFe4032e),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: _allPages[0].leading,
            title: Text(_allPages[0].title),
            onTap: () => _pushPage(context, _allPages[0]),
          ),
          ListTile(
            leading: _allPages[1].leading,
            title: Text(_allPages[1].title),
            onTap: () => _pushPage(context, _allPages[1]),
          ),
        ]),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
                icon: new Icon(Icons.settings),
                color: Theme.of(context).primaryColor,
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
        title: Text(
          "NSK",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 25, left: 15, right: 15),
          child: new Column(children: <Widget>[
            Text(
              "NSK",
              style: Theme.of(context).textTheme.title,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 20),
              child: Text(
                "Visão NSK 2026" +
                    "Definindo o futuro em movimento." +
                    "\nTrazemos movimento a vida, para enriquecer estilos de vida e construir um futuro melhor." +
                    "\nDedicados a revelar as necessidades da sociedade, transformamos ideias em movimento para oferecer soluções que vão além da imaginação." +
                    "\nSomos a NSK. E estamos definindo o futuro em movimento.",
                style: Theme.of(context).textTheme.body1,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    children: <Widget>[
                  Card(
                      elevation: 10,
                      child: FlatButton(
                        onPressed: () => _pushPage(context, _allPages[0]),
                        child: Text(
                          "Catálogo",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      )),
                  Card(
                      elevation: 10,
                      child: FlatButton(
                        onPressed: () => _pushPage(context, _allPages[1]),
                        child: Text(
                          "Distribuidores",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      )),
                  Card(
                      elevation: 10,
                      child: FlatButton(
                        onPressed: () => _pushPage(context, _allPages[0]),
                        child: Text(
                          "Favoritos",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      )),
                  Card(
                      elevation: 10,
                      child: FlatButton(
                        onPressed: () => _pushPage(context, _allPages[0]),
                        child: Text(
                          "Catálogo",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      )),
                ])),
          ]),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MapsDemo(),
    theme: ThemeData(
        primaryColor: Color(0xFFe4032e),
        textTheme: TextTheme(
            title: TextStyle(
              color: Color(0xFFe4032e),
              fontSize: 45,
            ),
            body1: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ))),
  ));
}
