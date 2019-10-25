import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

void main () => runApp(new UserListApp());

// 需要有一个对外输出的app class 初始化app的框架
// 创建一个有状态的class，只需要createState
// 创建一个state，处理业务逻辑，返回一个build
class UserListApp extends StatelessWidget {
   @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        title: 'My flutter User List',
        home: new UserList()
      );
    }
}

class UserList extends StatefulWidget {
  @override
  createState () => new UserListState();
}

class UserListState extends State<UserList> {

  var _userList = new Map();
  @override
  void initState () {
    super.initState();
    this._getUserList();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('UserList'),
      ),
      body: _buildUserList(),
    );
  }

  
  Widget _buildUserList () {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        return _buildRow(_userList[i]);
      },
    );
  }
  
  // 数据类型是什么？
  Widget _buildRow (text) {
    return new ListTile(
      title: new Text(text),
    );
  }

  _getUserList() async {
    var httpClient = new HttpClient();
    var uri = new Uri.http('randomuser.me', '/api', {'results': '30'});
    var request = await httpClient.getUrl(uri); // 打开http请求
    var response = await request.close();
    // 200 继续
    var responseBody = await response.transform(utf8.decoder).join();
    Map data = jsonDecode(responseBody);
    setState (() {
      _userList = data;
    });
  }
}

class Http {
   constructor () async {
    var httpClient = new HttpClient();
    var uri = new Uri.http('randomuser.me', '/api', {'results': '30'});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    Map data = jsonDecode(responseBody);
    return data;
  }
}

class User {
  @required final String avatar;
}