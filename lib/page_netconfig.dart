import 'package:flutter/material.dart';
import 'package:flutter_app/userInfo.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetConfigPage extends StatefulWidget {
  @override
  _NetConfigPage createState() => _NetConfigPage();
}

class _NetConfigPage extends State<NetConfigPage> {
  TextEditingController NameController = TextEditingController();
  TextEditingController PublicIpController = TextEditingController();
  TextEditingController PrivateIpController = TextEditingController();
  TextEditingController HeartTimeController = TextEditingController();
  TextEditingController TokenNameController = TextEditingController();
  TextEditingController TokenMsgController = TextEditingController();


  bool pwdShow = false;
  GlobalKey _formKey = GlobalKey<FormState>();
  bool _nameAutoFocus = true;
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      NameController.text = prefs.getString('school') ?? "";
      HeartTimeController.text = prefs.getString('heartTime') ?? "";
      PublicIpController.text = prefs.getString('publicIp') ?? "";
      PrivateIpController.text = prefs.getString('privateIp') ?? "";
      TokenNameController.text = prefs.getString('tokenName') ?? "";
      TokenMsgController.text = prefs.getString('tokenMsg') ?? "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:false,
      appBar: AppBar(title: Text('校园VPN设置')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: _nameAutoFocus,
                  controller: NameController,
                  decoration: InputDecoration(
                    labelText: '名称',
                    hintText: '学校名称',
                    prefixIcon: Icon(Icons.location_city),
                  ),
                  // 校验用户名（不能为空）
                  validator: (v) {
                    return v==null||v.trim().isNotEmpty ? null : '学校名不为空！';
                  }),
              TextFormField(
                controller: PublicIpController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                    labelText: '公网心跳IP(V4)',
                    hintText: '请输入IP地址',
                    prefixIcon: Icon(Icons.looks_4_outlined),
                    ),
                //校验密码（不能为空）
                validator: (v) {
                  return v==null||v.trim().isNotEmpty ? null : 'IP不为空！';
                },
              ),
              TextFormField(
                controller: PrivateIpController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                  labelText: '私网心跳IP(V4)',
                  hintText: '请输入IP地址',
                  prefixIcon: Icon(Icons.looks_4_rounded),
                ),
                //校验密码（不能为空）
                validator: (v) {
                  return v==null||v.trim().isNotEmpty ? null : 'IP不为空！';
                },
              ),
              TextFormField(
                controller: HeartTimeController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                  labelText: '心跳间隔(1~180s)',
                  hintText: '请输入心跳间隔',
                  prefixIcon: Icon(Icons.heart_broken_outlined),
                ),
                //校验密码（不能为空）
                validator: (v) {
                  return v==null||v.trim().isNotEmpty ? null : '心跳间隔不为空！';
                },
              ),
              TextFormField(
                controller: TokenNameController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                  labelText: '证书名称',
                  hintText: '请输入证书名称',
                  prefixIcon: Icon(Icons.book),
                ),
                //校验密码（不能为空）
                validator: (v) {
                  return v==null||v.trim().isNotEmpty ? null : '证书名不为空！';
                },
              ),
              TextFormField(
                controller: TokenMsgController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                  labelText: '证书token',
                  hintText: '请输入token信息',
                  prefixIcon: Icon(Icons.password),
                ),
                //校验密码（不能为空）
                validator: (v) {
                  return v==null||v.trim().isNotEmpty ? null : '证书秘钥不为空！';
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: ElevatedButton(
                    // color: Theme.of(context).primaryColor,
                    onPressed: _onLogin,
                    // textColor: Colors.white,
                    child: Text('保存'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
    // 先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
      Navigator.of(context).pop();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('school', NameController.text);
      await prefs.setString('publicIp', PublicIpController.text);
      await prefs.setString('privateIp', PrivateIpController.text);
      await prefs.setString('heartTime', HeartTimeController.text);
      await prefs.setString('tokenName', TokenNameController.text);
      await prefs.setString('tokenMsg', TokenMsgController.text);

      ScopedModel.of<UserInfo>(context).save2(NameController.text, PublicIpController.text,
          PrivateIpController.text, HeartTimeController.text,
          TokenNameController.text,TokenMsgController.text);
    }
  }
}
