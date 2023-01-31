import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/userInfo.dart';
import 'package:scoped_model/scoped_model.dart';
import 'base_page.dart';
import 'page_netconfig.dart';
import 'page_login.dart';
import 'cycleButton.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _PageHome();
  }
}

class _PageHome extends MyState<PageHome> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Page1(widget.title);
  }
}

class Page1 extends StatefulWidget {
  const Page1(this.title, {super.key});

  final String title;

  @override
  State<Page1> createState() => _Page1();
}

class _Page1 extends State<Page1> {
  final MethodChannel _methodChannel = const MethodChannel("vpn/run");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
        color: const Color(0xFFF5F5F5),
          child:Column( mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                    child: ClipRRect(
                      child: Image.asset("images/login.png"),
                    ),
                    onTap: () => otherIntent(context)),
                 Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Colors.red, Colors.orange.shade700]),
                                        //背景渐变
                                        borderRadius: BorderRadius.circular(5.0),
                                        //3像素圆角
                                        boxShadow: const [
                                          //阴影
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 4.0)
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.home,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "校园专网",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )),
                                onTap: () => vpnIntent(context),
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Colors.red, Colors.orange.shade700]),
                                        //背景渐变
                                        borderRadius: BorderRadius.circular(5.0),
                                        //3像素圆角
                                        boxShadow: const [
                                          //阴影
                                          BoxShadow(
                                              color: Colors.black54,
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 4.0)
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                                      child: Column(
                                        children: const [
                                          Icon(
                                            Icons.home,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "电子钱包",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )),
                                onTap: () => otherIntent(context),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 5, vertical: 30.0),
                                  child: Row(children: <Widget>[
                                    CycleButton(
                                        iconData: Icons.lock,
                                        title: "宿舍门锁",
                                        onTap: () => otherIntent(context)),
                                    CycleButton(
                                        iconData: Icons.border_color,
                                        title: "归宿签到",
                                        onTap: () => otherIntent(context)),
                                    CycleButton(
                                        iconData: Icons.paypal,
                                        title: "消费账单",
                                        onTap: () => otherIntent(context)),
                                    CycleButton(
                                        iconData: Icons.home_repair_service,
                                        title: "在线装修",
                                        onTap: () => otherIntent(context)),
                                  ]),
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset("images/bg.png"),
                          ),
                          onTap: () => otherIntent(context)),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset("images/bg.png"),
                          ),
                          onTap: () => otherIntent(context))
                    ],
                  ),
                )
              ]),
    )
    );
  }

  otherIntent(BuildContext context) {
    final username =
        ScopedModel.of<UserInfo>(context, rebuildOnChange: true).phoneNum;
    print(username);
    if(username!=null&&username.trim().isNotEmpty){
      Fluttertoast.showToast(
          msg: "敬请期待",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else{
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext con) => LoginPage()));
    }
  }

  vpnIntent(BuildContext context) async {
    final username =
        ScopedModel.of<UserInfo>(context, rebuildOnChange: true).phoneNum;
    final school =
        ScopedModel.of<UserInfo>(context, rebuildOnChange: true).school;
    print(username);
    print(school);
    if(username==null||!username.trim().isNotEmpty){
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext con) => LoginPage()));
    }else if(school==null||!school.trim().isNotEmpty){
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext con) => NetConfigPage()));
    }else{
      Map<String, String> data = {
        "publicIp":ScopedModel.of<UserInfo>(context, rebuildOnChange: true).publicIp,
        "privateIp":ScopedModel.of<UserInfo>(context, rebuildOnChange: true).privateIp,
        "name":ScopedModel.of<UserInfo>(context, rebuildOnChange: true).tokenName,
        "token":ScopedModel.of<UserInfo>(context, rebuildOnChange: true).tokenMsg
      };
       String? result =(await _methodChannel.invokeMethod("connection", data)) as String;
      Fluttertoast.showToast(
          msg: result,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
}
