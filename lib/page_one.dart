

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'page_four.dart';

class PageOne extends StatelessWidget{
  const PageOne({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ButtonOnePage(title);
  }
}

class ButtonOnePage extends StatefulWidget{
  const ButtonOnePage(this.title, {super.key});
  final String title;
  @override
  State<ButtonOnePage> createState() => _ButtonOnePage();
  
}

class _ButtonOnePage extends State<ButtonOnePage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Column(
        children: [
          Text(widget.title),
          TextButton(onPressed: (){_turnToNext(context);}, child:  Text("$_count")),
          Text(
            '$_count',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),

    );
  }
  _turnToNext(BuildContext context){
    //Navigator.push(context, MaterialPageRoute(builder: (BuildContext con) => PageFour()));
  setState(() {
    _count++;
  });
  }
}