

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'base_page.dart';

class PageMessage extends StatefulWidget{
  const PageMessage({super.key, required this.title});
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _PageMessage();
  }
}

class _PageMessage extends MyState<PageMessage>{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Page2(widget.title);
  }
}

class Page2 extends StatefulWidget{
  const Page2(this.title, {super.key});
  final String title;
  @override
  State<Page2> createState() => _Page2();

}

class _Page2 extends State<Page2> {

  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle:true ,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
      body:Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children:[Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.message,size: 70),
            Text("暂无消息"),
          ],
        )] ),

    );
  }
  _turnToNext(BuildContext context){
  }
}