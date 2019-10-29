import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:myflutter/components/user_list.dart';

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