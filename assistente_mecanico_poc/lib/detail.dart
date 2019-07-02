import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  Detail({
    this.title,
  });
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Text(this.title),
      ),
    );
  }
}
