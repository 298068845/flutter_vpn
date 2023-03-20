
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/page_home.dart';
import 'package:flutter_app/page_message.dart';
import 'package:flutter_app/page_me.dart';
import 'package:flutter_app/userInfo.dart';
import 'package:flutter_app/vpnInfo.dart';
import 'package:scoped_model/scoped_model.dart';
import 'page_one.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new ScopedModel<UserInfo>(
        model: new UserInfo(),
   child: MaterialApp(
      title: '校园VPN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const NavigatorWidget(),
    )
    );
  }
}

class NavigatorWidget extends StatefulWidget{
  const NavigatorWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NavigatorState();
  }
}

class _NavigatorState extends State<NavigatorWidget>{

  int tabIndexCurrent = 0;
  final PageController pageController = PageController(initialPage: 0);

  void _pageChange(int index){
    setState(() {
      tabIndexCurrent = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: PageView(
        onPageChanged: _pageChange,
        controller: pageController,
        children: const [
          PageHome(title: "首页"),
          PageMessage(title: "消息"),
          PageMe(title: "我的"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndexCurrent,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          pageController.jumpToPage(index);
          setState(() {
            tabIndexCurrent = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的")
        ],
      ),
    );
  }
}

