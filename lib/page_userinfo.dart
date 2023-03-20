import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'base_page.dart';
import 'userInfo.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  final String title = "个人资料";

  @override
  State<StatefulWidget> createState() {
    return _PageUserInfo();
  }
}

class _PageUserInfo extends MyState<UserInfoPage> {
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
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFFF5F5F5),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text("手机号:",
                                    style: TextStyle(fontSize: 15)))),
                        Expanded(
                          flex: 1,
                          child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                ScopedModel.of<UserInfo>(context,
                                        rebuildOnChange: true)
                                    .phoneNum,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.right,
                              )),
                        )
                      ],
                    ))),
            Padding(
              padding: const EdgeInsets.only(top: 500, left: 16, right: 16),
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(height: 55.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  // color: Theme.of(context).primaryColor,
                  onPressed: () => logout(context),
                  // textColor: Colors.white,
                  child: Text('退出登录'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone', "");
    await prefs.setString('password', "");
    ScopedModel.of<UserInfo>(context).save("", "");
    Navigator.of(context).pop();
  }
}
