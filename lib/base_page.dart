
import 'package:flutter/cupertino.dart';

abstract class MyState<T extends StatefulWidget> extends State<T> with AutomaticKeepAliveClientMixin{
  //导航栏切换时保持原有状态
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}