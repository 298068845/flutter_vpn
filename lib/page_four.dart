

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageFour extends StatelessWidget{
  const PageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("第二个页面"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("内容一"),
          ],
        ),
      ),
    );
  }
}