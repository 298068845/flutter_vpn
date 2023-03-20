import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'base_page.dart';
import 'userInfo.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  final String title = "消费账单";

  @override
  State<StatefulWidget> createState() {
    return _PageBillInfo();
  }
}

class _PageBillInfo extends MyState<BillPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Page(widget.title);
  }
}

class Page extends StatefulWidget {
  const Page(this.title, {super.key});

  final String title;

  @override
  State<Page> createState() => _Page();
}

class _Page extends State<Page> {

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
              Icon(Icons.paypal,size: 70),
              Text("暂无账单"),
            ],
          )] ),

    );
  }

}
