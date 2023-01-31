import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page_userinfo.dart';
import 'package:scoped_model/scoped_model.dart';
import 'base_page.dart';
import 'cycleButton.dart';
import 'page_four.dart';
import 'page_login.dart';
import 'page_netconfig.dart';
import 'userInfo.dart';

class PageMe extends StatefulWidget {
  const PageMe({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _PageMe();
  }
}

class _PageMe extends MyState<PageMe> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Page3(widget.title);
  }
}

class Page3 extends StatefulWidget {
  const Page3(this.title, {super.key});

  final String title;

  @override
  State<Page3> createState() => _Page3();
}

class _Page3 extends State<Page3> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Column(children: <Widget>[
              SizedBox(height: 30),
              RawMaterialButton(
                onPressed: () => UserInfoIntent(context),
                fillColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 40.0,
                ),
                padding: EdgeInsets.all(10.0),
                shape: CircleBorder(),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                ScopedModel.of<UserInfo>(context, rebuildOnChange: true).phoneNum!="" ? ScopedModel.of<UserInfo>(context, rebuildOnChange: true).phoneNum : "注册/登录",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ]),
          ),
        ),
        Expanded(
            flex: 4,
            child: Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFFF5F5F5),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Flex(
                        direction: Axis.vertical,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Column(children: <Widget>[
                                GestureDetector(
                                  onTap: () => vpnIntent(context),
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.airplane_ticket,
                                                size: 20.0,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text("校园VPN配置",
                                                  style:
                                                      TextStyle(fontSize: 15))
                                            ],
                                          ))),
                                ),
                              ])),
                        ])
                )))
      ],
    );
  }

  _turnToNext(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext con) => PageFour()));
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
    }else{
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext con) => NetConfigPage()));
    }
  }

  UserInfoIntent(BuildContext context) {
    final username =
        ScopedModel.of<UserInfo>(context, rebuildOnChange: true).phoneNum;
    print(username);
    if(username!=null&&username.trim().isNotEmpty){ Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext con) => UserInfoPage()));
    }else{
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext con) => LoginPage()));
    }
  }
}
